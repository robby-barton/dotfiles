---
description: Design audit - scout maps the module, design-reviewer evaluates it
---
Use the subagent tool with the chain parameter to execute this workflow:

1. First, use the "scout" agent to map the structure and relationships of this scope: $@
2. Then, use the "design-reviewer" agent to review the architecture and code quality of the mapped code (use {previous} placeholder)

Execute this as a chain, passing output between steps via {previous}.
