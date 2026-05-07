---
title: "Fenra"
date: 2026-03-02
description: "A distributed graph-analysis system for detecting suspicious public procurement patterns."
technologies: ["OCaml", "Erlang/OTP", "Graph Systems", "Neo4j"]
---

Fenra is a distributed system for detecting suspicious patterns in public procurement data.

The interesting part is systems work: coordinating specialized workers, representing relationships as a graph, verifying outputs, handling failure, and producing evidence trails that humans can inspect.

### The Problem

Procurement irregularities leave traces across multiple systems: financial records, company registries, contract documents, and award histories. The patterns are often obvious in hindsight but buried under noise in real time.

Detecting them requires several kinds of computation working together:

- Financial anomaly detection
- Relationship graph traversal
- Rule evaluation
- Document/entity extraction
- Evidence verification

### System Shape

**Specialized Workers:**

- **Transaction Analyzer**: Detects outliers in amounts, timing, and frequency
- **Network Mapper**: Traverses graphs to find hidden relationships between companies and officials
- **Rule Checker**: Flags procedural violations against procurement rules
- **Document Reader**: Extracts entities and relationships from unstructured text

**Verification Layer:**

- Validates findings against evidence
- Checks for contradictions between workers
- Assigns confidence scores
- Escalates only well-supported signals

### Graph-First Design

Fenra models entities as nodes and relationships as edges: companies, people, tenders, awards, transactions, addresses, and ownership links.

That makes multi-hop reasoning inspectable:

> Company A paid Company B → Company B's director is Person C → Person C is related to Procurement Officer D

The graph also gives every flag an auditable path instead of a black-box answer.

### Tech Stack

- **OCaml** for core logic and rule evaluation
- **Erlang/OTP** for orchestration, supervision, and fault tolerance
- **Neo4j** for relationship data and graph traversal
- **Structured extraction** for turning documents into typed records and graph edges
