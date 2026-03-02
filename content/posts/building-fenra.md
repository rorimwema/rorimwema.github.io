---
title: "Building Fenra: From 'Find the Corruption' to Swarm Intelligence"
date: 2026-03-02T15:38:26+03:00
draft: false
categories: ["Projects", "AI", "Systems Design"]
---

How I stopped trying to build one perfect AI and started building a team of specialized ones.

## The Problem I Actually Wanted to Solve

I started Fenra because I kept reading about corruption cases in Kenya where the patterns were obvious in hindsight—strange procurement patterns, shell companies, duplicate payments—but nobody caught them in real-time. The data was there, scattered across different systems. The connections were there too, but buried under too much noise for humans to spot quickly.

My first thought: build one smart AI that can read everything and tell you when something looks corrupt.

That didn't work.

## Why Single AI Models Fail at This

I tried the obvious approach first. Feed documents into a large language model, ask "is this corrupt?" The results were either:

- **Too vague** ("this seems suspicious" — thanks, but why?)
- **Too confident** (flagging legitimate transactions because of unusual but legal patterns)
- **Or missing things entirely** (not understanding that two shell companies sharing a director matters)

The problem isn't that LLMs are dumb. It's that corruption detection requires multiple types of reasoning at once:

- **Pattern matching** (unusual transaction amounts, timing)
- **Relationship tracing** (who knows who, company networks)
- **Legal knowledge** (what actually violates procurement laws)
- **Context awareness** (this is normal for this industry, weird for that one)

No single model is good at all of these. And even if one was, I didn't want a black box making accusations.

## The Swarm Idea

I started thinking about how actual investigations work. You don't have one super-detective who does everything. You have:

- A forensic accountant who traces money
- A network analyst who maps relationships
- A legal researcher who knows the regulations
- A senior investigator who reviews findings before anything goes to court

So I built Fenra as a swarm. Multiple specialized agents, each with a specific job, coordinated by a "Judge" that verifies conclusions before they're reported.

## Why Graph RAG Was the Right Choice

Early on, I tried standard RAG (Retrieval-Augmented Generation) — chunk documents, embed them, retrieve relevant chunks when querying. It worked for simple questions but failed on relationships.

**Example:** Company A paid Company B. Company B's director is the cousin of a procurement officer. That's three hops. Standard vector search doesn't handle hops well.

**Graph RAG** stores entities (companies, people, transactions) as nodes and relationships as edges. Now the "network analyst" agent can actually traverse connections—follow the money, find shared directors, spot circular payments.

The graph also gives us explainability. When Fenra flags something, we can show the path:

> "Flagged because Company A → paid → Company B → director is → Person C → related to → Procurement Officer D."

## The Architecture That Actually Works

Here's what I ended up with:

### Specialist Agents (The Workers)

- **Transaction Analyzer**: Looks at financial patterns, outliers, timing anomalies
- **Network Mapper**: Traverses the knowledge graph to find hidden relationships
- **Legal Checker**: Knows procurement regulations, flags procedural violations
- **Document Reader**: Extracts entities and relationships from unstructured text (contracts, emails)

### The Judge (The Verifier)

- Takes findings from specialists and verifies them against evidence
- Checks for contradictions between agents
- Assigns confidence scores
- Only escalates high-confidence, well-supported findings

### The Graph Store

- **Neo4j** for relationship data (who knows who, ownership structures)
- **Vector store** for semantic search (finding similar contract language, for example)
- Both feed into each other — vector search finds relevant documents, graph traversal finds connections within them

## Why OCaml and Erlang

I get asked why I didn't just use Python like everyone else. A few reasons:

**OCaml for the core logic:** Corruption detection involves a lot of data transformation and rule evaluation. OCaml's type system catches bugs at compile time that would be runtime errors in Python. When you're dealing with legal and financial data, "oops, NoneType has no attribute" isn't acceptable.

Also, hot code reloading means I can update an agent's logic without stopping the system. Important when you're iterating on detection rules.

## What I Learned the Hard Way

1. **Start with synthetic data:** I spent weeks trying to get real procurement data. Don't. Generate fake but realistic corruption patterns first. If your system can't find fake corruption you planted yourself, it won't find real corruption either.

2. **The graph schema matters more than the model:** I wasted time fine-tuning LLMs when the real problem was my graph schema didn't capture "subsidiary of" relationships properly. Fix your data model first.

3. **Explainability is not optional:** In a real deployment, every flag Fenra raises will be challenged. "The AI said so" is not a defense. The graph structure gives us audit trails by default.

4. **Human-in-the-loop is a feature, not a bug:** The Judge agent doesn't just verify AI outputs—it creates a checkpoint where human investigators can review, correct, and improve the system. The goal isn't to replace investigators, it's to make them 10x more effective.
