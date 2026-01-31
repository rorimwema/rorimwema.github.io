---
title: "Lisp Interpreter"
date: 2026-01-15
description: "A Lisp interpreter written in OCaml. Supports macros, tail-call optimization, and a minimal standard library."
repo_url: "https://github.com/rorimwema/lisp-ocaml"
technologies: ["OCaml", "Functional Programming", "Compilers"]
---

A Lisp interpreter written in OCaml, because writing a Lisp is a rite of passage every programmer should go through.

## Features

- **Lexical Scoping** — Proper environment model with closures
- **Macros** — Code that writes code
- **Tail-Call Optimization** — Recursion without stack overflow
- **REPL** — Interactive development environment

## Implementation

The interpreter follows the classic structure: lexer → parser → evaluator. Written in OCaml for strong type safety and pattern matching elegance.

## Example

```lisp
(define factorial (n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(factorial 5) ; => 120
```

Currently working on adding continuations and a module system.
