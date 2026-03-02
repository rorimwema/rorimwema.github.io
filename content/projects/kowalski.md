---
title: "Kowalski"
date: 2026-03-02
description: "A set-and-forget tax agentic-first platform designed for Kenyan SMEs."
technologies: ["OCaml", "Erlang", "AI", "Tax Automation"]
---

Kowalski is a set-and-forget tax agentic-first platform designed for Kenyan SMEs.

### What It Does

- **Multi-gateway ingestion**: Pulls transactions from M-Pesa, bank APIs, Stripe, and other payment providers
- **AI-driven reconciliation**: Automatically matches payments to invoices, categorizes expenses, and flags anomalies
- **Immutable tax rules**: Kenyan tax regulations encoded as verifiable logic—no guesswork, no drift
- **Direct KRA filing**: Files returns directly to the Kenya Revenue Authority via eTIMS/GavaConnect APIs

### Why Agentic?

Instead of rigid automation, Kowalski uses specialized agents that handle different aspects of tax compliance:

- **Ingestion Agent**: Handles API connections, rate limiting, and data normalization
- **Reconciliation Agent**: Uses ML to match fuzzy transaction descriptions to actual business activities
- **Compliance Agent**: Applies Kenyan tax rules (VAT, income tax, withholding) to categorized transactions
- **Filing Agent**: Prepares and submits returns, handling KRA's specific formatting requirements

Each agent reports to a supervisor that ensures consistency and flags edge cases for human review.

### Built With

- **OCaml** for the tax rule engine—type safety is non-negotiable when dealing with government compliance
- **Erlang/OTP** for the agent orchestration—fault tolerance and hot code reloading are essential for financial systems
- **LLMs** for classification and anomaly detection, constrained by structured output schemas
