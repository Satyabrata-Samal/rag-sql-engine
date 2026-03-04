from __future__ import annotations

import argparse
import html
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import parse_qs

from main import build_engine


def render_page(question: str = "", output: str = "", status: str = "") -> str:
    question_html = html.escape(question)
    output_html = html.escape(output)
    status_html = html.escape(status)

    return f"""<!doctype html>
<html lang=\"en\">
<head>
  <meta charset=\"utf-8\" />
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />
  <title>RAG SQL UI</title>
  <style>
    :root {{
      --bg: #f7f5ee;
      --card: #ffffff;
      --text: #1f2937;
      --muted: #6b7280;
      --accent: #0f766e;
      --accent-2: #115e59;
      --border: #d1d5db;
      --ok: #065f46;
      --error: #991b1b;
    }}
    body {{
      margin: 0;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial;
      background: radial-gradient(circle at 10% 20%, #fff7d6, #f7f5ee 40%);
      color: var(--text);
    }}
    .wrap {{
      max-width: 900px;
      margin: 40px auto;
      padding: 0 16px;
    }}
    .card {{
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 12px;
      padding: 18px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.06);
    }}
    h1 {{ margin: 0 0 8px 0; font-size: 22px; }}
    p {{ margin: 0 0 14px 0; color: var(--muted); }}
    textarea {{
      width: 100%;
      min-height: 110px;
      border: 1px solid var(--border);
      border-radius: 8px;
      padding: 10px;
      font-size: 14px;
      resize: vertical;
      box-sizing: border-box;
    }}
    button {{
      margin-top: 10px;
      background: var(--accent);
      color: #fff;
      border: 0;
      border-radius: 8px;
      padding: 10px 14px;
      cursor: pointer;
      font-weight: 600;
    }}
    button:hover {{ background: var(--accent-2); }}
    .status {{
      margin-top: 14px;
      font-size: 13px;
      color: var(--muted);
    }}
    .status.ok {{ color: var(--ok); }}
    .status.error {{ color: var(--error); }}
    pre {{
      margin-top: 10px;
      padding: 12px;
      background: #0b1020;
      color: #d6e2ff;
      border-radius: 8px;
      overflow-x: auto;
      white-space: pre-wrap;
      word-break: break-word;
    }}
  </style>
</head>
<body>
  <div class=\"wrap\">
    <div class=\"card\">
      <h1>RAG SQL Test UI</h1>
      <p>Ask a business question and inspect generated SQL and validation output.</p>
      <form method=\"post\">
        <label for=\"question\">Question</label>
        <textarea id=\"question\" name=\"question\" placeholder=\"Show total invoice revenue by country\">{question_html}</textarea>
        <button type=\"submit\">Generate SQL</button>
      </form>
      <div class=\"status {'ok' if status.startswith('OK') else 'error' if status.startswith('ERROR') else ''}\">{status_html}</div>
      <pre>{output_html}</pre>
    </div>
  </div>
</body>
</html>
"""


class RAGSQLUIHandler(BaseHTTPRequestHandler):
    engine = None

    def _send_html(self, body: str, status_code: int = 200) -> None:
        payload = body.encode("utf-8")
        self.send_response(status_code)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)

    def do_GET(self) -> None:  # noqa: N802
        self._send_html(render_page())

    def do_POST(self) -> None:  # noqa: N802
        length = int(self.headers.get("Content-Length", "0"))
        raw = self.rfile.read(length).decode("utf-8")
        data = parse_qs(raw)
        question = (data.get("question", [""])[0] or "").strip()

        if not question:
            self._send_html(render_page(question=question, output="", status="ERROR: question is required"), 400)
            return

        try:
            result = self.engine.answer(question)
            if result.is_valid and result.sql:
                output = result.sql
                status = "OK: SQL generated and validated"
            else:
                output = (
                    f"Candidate SQL:\n{result.sql or '<none>'}\n\n"
                    f"Validation error:\n{result.validation_error or 'unknown error'}"
                )
                status = "ERROR: SQL validation failed"
            self._send_html(render_page(question=question, output=output, status=status))
        except Exception as exc:  # surface runtime errors in UI for debugging
            self._send_html(
                render_page(
                    question=question,
                    output=str(exc),
                    status="ERROR: runtime exception",
                ),
                500,
            )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Simple RAG SQL web UI")
    parser.add_argument("--host", default="127.0.0.1", help="Host to bind")
    parser.add_argument("--port", type=int, default=8080, help="Port to bind")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    RAGSQLUIHandler.engine = build_engine()
    server = HTTPServer((args.host, args.port), RAGSQLUIHandler)
    print(f"RAG SQL UI running at http://{args.host}:{args.port}")
    server.serve_forever()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
