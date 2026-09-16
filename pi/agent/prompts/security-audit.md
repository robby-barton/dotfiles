---
description: Security audit - scout maps the attack surface, security-reviewer analyzes it
---
Use the subagent tool with the chain parameter to execute this workflow:

1. First, use the "scout" agent to map all untrusted input entry points (HTTP handlers, CLI args, file reads, env vars) and the code paths they flow into, for this scope: $@
2. Then, use the "security-reviewer" agent to perform a full security review of the mapped surface (use {previous} placeholder)

Execute this as a chain, passing output between steps via {previous}.
