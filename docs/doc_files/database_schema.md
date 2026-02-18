# Chinook Database Schema

**Auto-generated from SQL schema on: 2024-01-15**

This document describes the structure of the Chinook music store database. The database models customers, employees, invoices, and a catalog of music products organized by artist, album, genre, and media type.

## Quick Overview

The Chinook database is a sample music store database containing:
- **Customer Data:** Information about customers who purchase music
- **Invoice Data:** Purchase transactions and line items
- **Product Catalog:** Tracks, albums, artists, genres, and media types
- **Staff:** Employees and their reporting structure
- **Playlists:** Curated collections of tracks

## Table of Contents

- [Album](#album)
- [Artist](#artist)
- [Customer](#customer)
- [Employee](#employee)
- [Genre](#genre)
- [Invoice](#invoice)
- [Invoice Line](#invoice_line)
- [Media Type](#media_type)
- [Playlist](#playlist)
- [Playlist Track](#playlist_track)
- [Track](#track)

---

## Album

**Purpose:** Stores music albums/records

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `album_id` | INT NOT NULL | ✗ | Unique album identifier. Primary key. |
| `title` | VARCHAR(160) NOT NULL | ✗ | Album/record name |
| `artist_id` | INT NOT NULL | ✗ | Foreign key to Artist table. Links album to artist. **(FK → artist.artist_id)** |

### CREATE Statement

```sql
CREATE TABLE album (
    album_id INT NOT NULL,
    title VARCHAR(160) NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT album_pkey PRIMARY KEY (album_id)
);
```

### Business Notes

- Links to Artist table - every album must have an artist
- Title is required and should be unique per artist
- Primary key is album_id (NOT a composite key)

---

## Artist

**Purpose:** Stores musician/artist information

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `artist_id` | INT NOT NULL | ✗ | Unique artist identifier. Primary key. |
| `name` | VARCHAR(120) | ✓ | Artist/musician name |

### CREATE Statement

```sql
CREATE TABLE artist (
    artist_id INT NOT NULL,
    name VARCHAR(120),
    CONSTRAINT artist_pkey PRIMARY KEY (artist_id)
);
```

### Business Notes

- Simple lookup table for artist information
- Name field is optional (nullable)
- Referenced by Album table

---

## Customer

**Purpose:** Stores customer account information. One row per customer.

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `customer_id` | INT NOT NULL | ✗ | Unique customer identifier. Primary key. |
| `first_name` | VARCHAR(40) NOT NULL | ✗ | Customer first name |
| `last_name` | VARCHAR(20) NOT NULL | ✗ | Customer last name |
| `company` | VARCHAR(80) | ✓ | Company name (if customer is B2B) |
| `address` | VARCHAR(70) | ✓ | Street address |
| `city` | VARCHAR(40) | ✓ | City |
| `state` | VARCHAR(40) | ✓ | State/province |
| `country` | VARCHAR(40) | ✓ | Customer location. IMPORTANT: Used in geographic revenue analysis |
| `postal_code` | VARCHAR(10) | ✓ | Postal code |
| `phone` | VARCHAR(24) | ✓ | Phone number |
| `fax` | VARCHAR(24) | ✓ | Fax number |
| `email` | VARCHAR(60) NOT NULL | ✗ | Customer email address. Used for contact. |
| `support_rep_id` | INT | ✓ | Foreign key to Employee. Indicates assigned support representative. **(FK → employee.employee_id)** |

### CREATE Statement

```sql
CREATE TABLE customer (
    customer_id INT NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    company VARCHAR(80),
    address VARCHAR(70),
    city VARCHAR(40),
    state VARCHAR(40),
    country VARCHAR(40),
    postal_code VARCHAR(10),
    phone VARCHAR(24),
    fax VARCHAR(24),
    email VARCHAR(60) NOT NULL,
    support_rep_id INT,
    CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);
```

### Business Notes

- Central entity - most queries involve this table
- One row per customer account
- Email is required and should be unique
- Support_rep_id links to assigned employee
- Country field is critical for geographic revenue analysis
- First and last name are required

---

## Employee

**Purpose:** Stores employee/staff information

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `employee_id` | INT NOT NULL | ✗ | Unique employee identifier. Primary key. |
| `last_name` | VARCHAR(20) NOT NULL | ✗ | Employee last name |
| `first_name` | VARCHAR(20) NOT NULL | ✗ | Employee first name |
| `title` | VARCHAR(30) | ✓ | Job title/position |
| `reports_to` | INT | ✓ | Foreign key to Employee. Self-referencing for hierarchical reporting. **(FK → employee.employee_id)** |
| `birth_date` | TIMESTAMP | ✓ | Employee birth date |
| `hire_date` | TIMESTAMP | ✓ | Date employee was hired |
| `address` | VARCHAR(70) | ✓ | Street address |
| `city` | VARCHAR(40) | ✓ | City |
| `state` | VARCHAR(40) | ✓ | State/province |
| `country` | VARCHAR(40) | ✓ | Country |
| `postal_code` | VARCHAR(10) | ✓ | Postal code |
| `phone` | VARCHAR(24) | ✓ | Phone number |
| `fax` | VARCHAR(24) | ✓ | Fax number |
| `email` | VARCHAR(60) | ✓ | Email address |

### CREATE Statement

```sql
CREATE TABLE employee (
    employee_id INT NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    title VARCHAR(30),
    reports_to INT,
    birth_date TIMESTAMP,
    hire_date TIMESTAMP,
    address VARCHAR(70),
    city VARCHAR(40),
    state VARCHAR(40),
    country VARCHAR(40),
    postal_code VARCHAR(10),
    phone VARCHAR(24),
    fax VARCHAR(24),
    email VARCHAR(60),
    CONSTRAINT employee_pkey PRIMARY KEY (employee_id)
);
```

### Business Notes

- Self-referencing: reports_to links to manager (another employee)
- Support_rep_id in Customer table links back here (employee acts as customer service rep)
- Hire_date and birth_date are timestamp fields
- Forms organizational hierarchy

---

## Genre

**Purpose:** Stores music genre/category information

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `genre_id` | INT NOT NULL | ✗ | Unique genre identifier. Primary key. |
| `name` | VARCHAR(120) | ✓ | Genre name (e.g., Rock, Jazz, Pop) |

### CREATE Statement

```sql
CREATE TABLE genre (
    genre_id INT NOT NULL,
    name VARCHAR(120),
    CONSTRAINT genre_pkey PRIMARY KEY (genre_id)
);
```

### Business Notes

- Simple lookup table for music genres
- Name is optional but should be filled for utility
- Referenced by Track table
- Used for genre-based analysis and recommendations

---

## Invoice

**Purpose:** Stores individual invoices/purchase transactions from customers

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `invoice_id` | INT NOT NULL | ✗ | Unique invoice identifier. Primary key. |
| `customer_id` | INT NOT NULL | ✗ | Foreign key to Customer table. Links invoice to customer. **(FK → customer.customer_id)** |
| `invoice_date` | TIMESTAMP NOT NULL | ✗ | Date of purchase. CRITICAL FOR CHURN: customers with 0 invoices in 90 days = churned |
| `billing_address` | VARCHAR(70) | ✓ | Billing address for invoice |
| `billing_city` | VARCHAR(40) | ✓ | Billing city |
| `billing_state` | VARCHAR(40) | ✓ | Billing state |
| `billing_country` | VARCHAR(40) | ✓ | Billing country |
| `billing_postal_code` | VARCHAR(10) | ✓ | Billing postal code |
| `total` | NUMERIC(10,2) NOT NULL | ✗ | Invoice total amount. CRITICAL FOR REVENUE: sum all for total revenue metric |

### CREATE Statement

```sql
CREATE TABLE invoice (
    invoice_id INT NOT NULL,
    customer_id INT NOT NULL,
    invoice_date TIMESTAMP NOT NULL,
    billing_address VARCHAR(70),
    billing_city VARCHAR(40),
    billing_state VARCHAR(40),
    billing_country VARCHAR(40),
    billing_postal_code VARCHAR(10),
    total NUMERIC(10,2) NOT NULL,
    CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id)
);
```

### Business Notes

- Represents a single purchase transaction
- Multiple line items per invoice (see invoice_line)
- Invoice date is critical for churn analysis
- Total is sum of line items (actually stored in this table, not calculated)
- Billing address can differ from customer address

---

## Invoice Line

**Purpose:** Stores individual line items within invoices

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `invoice_line_id` | INT NOT NULL | ✗ | Unique invoice line item identifier. Primary key. |
| `invoice_id` | INT NOT NULL | ✗ | Foreign key to Invoice table. **(FK → invoice.invoice_id)** |
| `track_id` | INT NOT NULL | ✗ | Foreign key to Track table. Links to the product sold. **(FK → track.track_id)** |
| `unit_price` | NUMERIC(10,2) NOT NULL | ✗ | Price per unit at time of sale |
| `quantity` | INT NOT NULL | ✗ | Number of units sold on this line |

### CREATE Statement

```sql
CREATE TABLE invoice_line (
    invoice_line_id INT NOT NULL,
    invoice_id INT NOT NULL,
    track_id INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT invoice_line_pkey PRIMARY KEY (invoice_line_id)
);
```

### Business Notes

- Bridge table connecting Invoice to Track
- Stores quantity and unit_price at time of sale
- Unit_price may differ from current Track.unit_price (price changes over time)
- Total for line = unit_price * quantity
- Multiple line items create one invoice

---

## Media Type

**Purpose:** Stores media format types (MP3, AAC, etc.)

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `media_type_id` | INT NOT NULL | ✗ | Unique media type identifier. Primary key. |
| `name` | VARCHAR(120) | ✓ | Media type name (e.g., MPEG audio file, Protected AAC) |

### CREATE Statement

```sql
CREATE TABLE media_type (
    media_type_id INT NOT NULL,
    name VARCHAR(120),
    CONSTRAINT media_type_pkey PRIMARY KEY (media_type_id)
);
```

### Business Notes

- Lookup table for audio file formats
- Examples: MPEG audio file, Protected AAC, Protected MPEG-4 video
- Referenced by Track table
- Used to identify file format compatibility

---

## Playlist

**Purpose:** Stores curated music playlists

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `playlist_id` | INT NOT NULL | ✗ | Unique playlist identifier. Primary key. |
| `name` | VARCHAR(120) | ✓ | Playlist name |

### CREATE Statement

```sql
CREATE TABLE playlist (
    playlist_id INT NOT NULL,
    name VARCHAR(120),
    CONSTRAINT playlist_pkey PRIMARY KEY (playlist_id)
);
```

### Business Notes

- Simple lookup for playlists
- Tracks are linked via PlaylistTrack junction table
- Many-to-many relationship with Track

---

## Playlist Track

**Purpose:** Junction/bridge table linking tracks to playlists (many-to-many)

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `playlist_id` | INT NOT NULL | ✗ | Foreign key to Playlist table. Part of composite primary key. **(FK → playlist.playlist_id)** |
| `track_id` | INT NOT NULL | ✗ | Foreign key to Track table. Part of composite primary key. **(FK → track.track_id)** |

### CREATE Statement

```sql
CREATE TABLE playlist_track (
    playlist_id INT NOT NULL,
    track_id INT NOT NULL,
    CONSTRAINT playlist_track_pkey PRIMARY KEY (playlist_id, track_id)
);
```

### Business Notes

- Junction table for many-to-many relationship
- Composite primary key (playlist_id, track_id)
- One track can be in multiple playlists
- One playlist can have multiple tracks

---

## Track

**Purpose:** Stores music tracks/songs. Core product in the catalog.

### Columns

| Column | Type | Nullable | Business Meaning |
|--------|------|----------|------------------|
| `track_id` | INT NOT NULL | ✗ | Unique track identifier. Primary key. |
| `name` | VARCHAR(200) NOT NULL | ✗ | Track/song name |
| `album_id` | INT | ✓ | Foreign key to Album table. Links track to album. **(FK → album.album_id)** |
| `media_type_id` | INT NOT NULL | ✗ | Foreign key to MediaType table. File format of the track. **(FK → media_type.media_type_id)** |
| `genre_id` | INT | ✓ | Foreign key to Genre table. Musical category. **(FK → genre.genre_id)** |
| `composer` | VARCHAR(220) | ✓ | Track composer/writer name |
| `milliseconds` | INT NOT NULL | ✗ | Track duration in milliseconds |
| `bytes` | INT | ✓ | Track file size in bytes |
| `unit_price` | NUMERIC(10,2) NOT NULL | ✗ | Selling price of the track |

### CREATE Statement

```sql
CREATE TABLE track (
    track_id INT NOT NULL,
    name VARCHAR(200) NOT NULL,
    album_id INT,
    media_type_id INT NOT NULL,
    genre_id INT,
    composer VARCHAR(220),
    milliseconds INT NOT NULL,
    bytes INT,
    unit_price NUMERIC(10,2) NOT NULL,
    CONSTRAINT track_pkey PRIMARY KEY (track_id)
);
```

### Business Notes

- Core product in the catalog
- Foreign keys link to Album, Genre, MediaType
- Unit_price varies but is set at time of sale (see invoice_line)
- Milliseconds is track duration - useful for playlist creation
- Composer field captures artist/writer information
- Bytes field represents digital file size

---

## Relationships

### Foreign Key Relationships

**album**
- `artist_id` → `artist.artist_id`

**customer**
- `support_rep_id` → `employee.employee_id`

**employee**
- `reports_to` → `employee.employee_id`

**invoice**
- `customer_id` → `customer.customer_id`

**invoice_line**
- `invoice_id` → `invoice.invoice_id`
- `track_id` → `track.track_id`

**playlist_track**
- `playlist_id` → `playlist.playlist_id`
- `track_id` → `track.track_id`

**track**
- `album_id` → `album.album_id`
- `genre_id` → `genre.genre_id`
- `media_type_id` → `media_type.media_type_id`

### Conceptual Model (ERD)

```
Artist
  │ (artist_id)
  │
  └─→ Album ─────┐
                  │ (album_id)
                  │
                  └─→ Track ────────┬─→ Genre
                       │            │
                       │            └─→ MediaType
                       │
                       │ (track_id)
                       │
        ┌──────────────┘
        │
  InvoiceLine
        │
        │ (invoice_id)
        │
  Invoice
        │
        │ (customer_id)
        │
  Customer
        │
        │ (support_rep_id)
        │
  Employee
        │
        │ (reports_to - self-referencing)
        │
  Employee (manager)

Playlist ←─(many-to-many)─→ Track (via PlaylistTrack)
```

---

## Important Notes for SQL Queries

### Revenue Metrics
- **Total Revenue:** `SUM(invoice.total)` from all invoices
- **Revenue by Customer:** `GROUP BY customer_id, SUM(invoice.total)`
- **Revenue by Country:** `GROUP BY customer.country, SUM(invoice.total)`
- **Revenue by Genre:** `GROUP BY genre.name, SUM(invoice.total)` (requires joins through invoice_line → track → genre)
- **Average Order Value:** `AVG(invoice.total)` across all invoices

### Customer Metrics
- **Active Customers:** Customers with at least one invoice
- **Churn (Inactive Customers):** Customers with NO invoices in last 90 days
  - SQL: `WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM invoice WHERE invoice_date >= NOW() - INTERVAL '90 days')`
- **Customer Lifetime Value (CLV):** `SUM(invoice.total)` per customer
- **Customer Count by Country:** `GROUP BY customer.country, COUNT(*)`

### Product Metrics
- **Popular Tracks:** `COUNT(*)` or `SUM(invoice_line.quantity)` grouped by track
- **Product Adoption:** Number of customers who bought each track
- **Revenue per Track:** `SUM(invoice_line.unit_price * invoice_line.quantity)` grouped by track
- **Best Selling Albums:** Join track → album → sum revenue

### Sales Analysis
- **Sales by Month:** `DATE_TRUNC('month', invoice.invoice_date)`
- **Sales Trend:** Compare month-over-month or year-over-year
- **Top Customers:** `ORDER BY total_spent DESC LIMIT 10`

### Data Characteristics
- **Historical Data:** Focuses on music store transactions
- **Temporal Range:** Check actual invoice dates in data (likely 2009-2013 in sample)
- **No Marketing Data:** Cannot calculate CAC (Customer Acquisition Cost)
- **No Inventory:** No stock/warehouse management data

### Key Joins

Common join patterns:

**Customer → Invoice:**
```sql
SELECT c.*, i.* 
FROM customer c 
LEFT JOIN invoice i ON c.customer_id = i.customer_id
```

**Invoice → InvoiceLine → Track:**
```sql
SELECT i.*, il.*, t.* 
FROM invoice i 
JOIN invoice_line il ON i.invoice_id = il.invoice_id 
JOIN track t ON il.track_id = t.track_id
```

**Track → Album → Artist:**
```sql
SELECT t.*, a.*, art.* 
FROM track t 
LEFT JOIN album a ON t.album_id = a.album_id 
LEFT JOIN artist art ON a.artist_id = art.artist_id
```

**Track → Genre:**
```sql
SELECT t.*, g.* 
FROM track t 
LEFT JOIN genre g ON t.genre_id = g.genre_id
```

**Track → MediaType:**
```sql
SELECT t.*, m.* 
FROM track t 
JOIN media_type m ON t.media_type_id = m.media_type_id
```

---

## Schema Statistics

| Table | Purpose | Key Relationships |
|-------|---------|-------------------|
| album | Music albums | Artist (FK), Track (FK) |
| artist | Musicians/bands | Album (FK) |
| customer | Customers | Employee-support (FK), Invoice (FK) |
| employee | Staff | Employee-hierarchy (self-ref), Customer (FK) |
| genre | Music categories | Track (FK) |
| invoice | Purchases | Customer (FK), InvoiceLine (FK) |
| invoice_line | Purchase items | Invoice (FK), Track (FK) |
| media_type | File formats | Track (FK) |
| playlist | Curated collections | PlaylistTrack (FK) |
| playlist_track | Playlist membership | Playlist (FK), Track (FK) |
| track | Music tracks/products | Album (FK), Genre (FK), MediaType (FK) |

---

## Using This Schema with Your RAG System

When indexing this markdown in Chroma for RAG:

1. **Split by table:** Each table section becomes a searchable chunk
2. **Key searchable terms:** 
   - Table names: `customer`, `invoice`, `track`
   - Column names: `customer_id`, `invoice_date`, `total`
   - Business meanings: `churn`, `revenue`, `adoption`
   - Relationships: `foreign key`, `join`, `references`
3. **When user asks:** "Show revenue by country"
   - RAG finds: Customer table (Country column), Invoice table (Total column), their relationship
   - LLM generates: Correct SQL with proper joins

---

## Document Info

- **Generated:** 2024-01-15
- **Database:** Chinook Music Store
- **Tables:** 11
- **Version:** 1.0

For updates or corrections, regenerate this document from the source SQL file.
