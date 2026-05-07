---
title: "Lisp Interpreter"
date: 2026-03-03
description: "An OCaml Lisp interpreter for learning language implementation from the inside."
technologies: ["OCaml", "Interpreters", "Parsing", "PLT"]
---

A small Lisp interpreter written in OCaml.

This is a systems-learning project: less about inventing a new language, more about understanding the machinery behind one.

### What I'm Exploring

- Lexing and parsing
- AST design
- Evaluation strategy
- Environments and lexical scope
- Error reporting
- Macros and metaprogramming
- Runtime representation

### Why Lisp?

Lisp is small enough to hold in your head but deep enough to teach real language implementation ideas. You get syntax, evaluation, environments, functions, macros, and a runtime model without needing a mountain of ceremony first.

### Why OCaml?

The type system keeps the interpreter honest. ASTs, values, environments, and evaluation errors all become explicit, which makes the implementation easier to reason about as it grows.
