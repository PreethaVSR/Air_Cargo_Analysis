# Air Cargo Analysis

This project focuses on evaluating the performance, efficiency, and market dynamics of an air cargo operation using data-driven analysis.It involves collecting and analyzing shipment, aircraft, route, financial, and operational data to uncover trends, identify bottlenecks, and highlight opportunities for improved logistics and profitability.
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
