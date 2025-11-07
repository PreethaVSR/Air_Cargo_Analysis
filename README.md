# Air Cargo Analysis

Welcome to **Air Cargo Analysis**, a project designed to analyze and visualize trends in the air cargo industry. This repository provides tools and scripts for processing air cargo datasets, generating insightful visualizations, and supporting data-driven decision-making.

This repository contains practical SQL scripts, procedures, views, and queries useful for designing, querying, and managing an airlines database. Below you'll find a summary and explanation of each area covered, with code samples included.

---

## Entity Relationship (ER) Diagram

**Entities:**
- **Customer**
- **Ticket_Details**
- **Routes**
- **Passengers_On_Flights**

**Relationships:**
- Customers book tickets and travel on flights (`Ticket_Details` and `Passengers_On_Flights` reference `Customer`)
- Each flight operates on a route (`Routes` is referenced in `Passengers_On_Flights` and `Ticket_Details`)
- Aircraft information appears in multiple tables.

---

## Notes

- Adjust data types and constraints to match your RDBMS (MySQL, MariaDB, etc.)
- For best practices, always review constraints and error handling in stored procedures/functions.
- The scripts provide a strong foundation for airlines booking, customer management, route handling, and reporting.

---
