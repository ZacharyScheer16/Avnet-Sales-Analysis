## Overview

This is a MySQL version of the Microsoft Access 2010 *Northwind* sample database, re-engineered for MySQL 5+.

The Northwind sample database was provided with Microsoft Access as a tutorial schema for managing small business customers, orders, inventory, purchasing, suppliers, shipping, and employees. Northwind is an excellent tutorial schema for a small-business ERP, with customers, orders, inventory, purchasing, suppliers, shipping, employees, and single-entry accounting.

## Included Files

* Model:
    * northwind.mwb (MySQL Workbench v6.2)
* ER Diagram:
    * northwind-erd.pdf
    * northwind-erd.png
* Structure:
    * northwind.sql
    * northwind-default-current-timestamp.sql (uses DEFAULT CURRENT TIMESTAMP, requires MySQL 5.6.5+)
* Data:
    * northwind-data.sql

## How this was made

* Created Northwind.aacdb using MS Access 2010 (File > New > Sample Templates > Northwind > SaveAs).
* Created basic SQL equivalent of Northwind schema for MySQL using using BullZip ["Access to MySQL"](http://www.bullzip.com).[1]
* Replaced CamelCase identifier names with lower_case_with_underscore identifier names.
* Replaced " " (space) and "/" (forward slash) characters in identifiers with _underscores_.
* Renamed table primary keys "id".
* Renamed table foreign keys "xxx_id" (e.g. "inventory_id").
* Changed record-create and modify-date columns to type DATETIME (to avoid the 1997 - 2038 UTC date range restriction of TIMESTAMP, and also other limitations).
* Added foreign key relationships and created ERD using MySQL Workbench.
* Imported SQL into MySQL Workbench
    * Added foreign key relationships visually
    * Exported ER Diagrams
* Removed redundant indexes and deleted old files

## Credits

This version is a fork from [MyWind](https://github.com/dalers/mywind)