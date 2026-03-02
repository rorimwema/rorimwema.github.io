---
title: "Fenra"
date: 2026-03-02
description: "A swarm intelligence system for detecting corruption in public procurement."
technologies: ["OCaml", "Erlang", "Graph RAG", "Neo4j"]
---

Fenra is a multi-agent system for detecting corruption patterns in public procurement data. It uses a swarm of specialized AI agents coordinated by a verification layer called "the Judge."

### The Problem

Corruption in procurement leaves traces across multiple systems—financial records, company registries, contract documents. The patterns are obvious in hindsight but buried under noise in real-time. Single AI models fail because corruption detection requires simultaneous reasoning about:

- Financial anomalies (pattern matching)
- Relationship networks (graph traversal)
- Legal compliance (rule evaluation)
- Industry context (domain knowledge)

### The Swarm Architecture

**Specialist Agents (The Workers):**

- **Transaction Analyzer**: Detects outliers in amounts, timing, and frequency
- **Network Mapper**: Traverses knowledge graphs to find hidden relationships between companies and officials
- **Legal Checker**: Flags procedural violations against procurement regulations
- **Document Reader**: Extracts entities and relationships from unstructured text

**The Judge (The Verifier):**

- Validates findings against evidence
- Checks for contradictions between agents
- Assigns confidence scores
- Only escalates high-confidence, well-supported flags

### Graph RAG

Fenra uses Graph RAG instead of standard vector search. Entities (companies, people, transactions) are nodes; relationships are edges. This enables multi-hop reasoning:

> "Company A paid Company B → Company B's director is Person C → Person C is related to Procurement Officer D"

The graph structure also provides explainability—every flag comes with an auditable path.

### Tech Stack

- **Neo4j** for relationship data and graph traversal
- **Vector store** for semantic search over documents
- **OCaml** for the core logic—type safety for financial and legal data
- **Erlang** for agent orchestration—hot code reloading without downtime
