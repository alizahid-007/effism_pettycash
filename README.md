# EFFISM – Petty Cash Workflow System

## Overview
EFFISM is a role-based petty cash management system with
multi-level approval workflows, including Admin-defined workflows.

## Features
- Role-based approvals
- Job Number & Transport conditional routing
- Invoice & Logistics verification
- Admin-configurable workflows
- Full audit trail
- Attachment support

## Tech Stack
- PHP (PDO)
- MySQL
- JavaScript
- HTML / Bootstrap

## Project Structure
- /api        → Backend APIs
- /includes   → DB & Auth helpers
- /js         → Frontend JS
- /database   → DB schema & seed data

## Database Setup

### 1. Create database
```sql
CREATE DATABASE effism_pettycash;
