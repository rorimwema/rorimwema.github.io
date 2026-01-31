---
title: "Crawlr"
date: 2025-12-10
description: "A minimal search engine built in Haskell. Web crawler, inverted index, and ranking algorithm from scratch."
repo_url: "https://github.com/rorimwema/crawlr"
technologies: ["Haskell", "Web Crawling", "Information Retrieval"]
---

Crawlr is a minimal search engine built from scratch in Haskell. It crawls the web, builds an inverted index, and ranks pages using a simplified PageRank algorithm.

## Components

- **Web Crawler** — Polite, concurrent crawling with rate limiting
- **Indexer** — Inverted index for fast full-text search
- **Ranker** — Link analysis and content scoring
- **Query Engine** — Boolean and ranked retrieval

## Why Haskell?

The type system catches bugs at compile time. Concurrency is elegant with Software Transactional Memory (STM). And honestly, it's a good excuse to learn more about functional programming patterns.

## Current Status

Indexing ~10,000 pages. Working on improving ranking quality and query speed.
