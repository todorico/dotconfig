# DotConfig

Automatically updated and deployable configuration for my linux systems.

## Dependencies

### Core

Those programs are required to deploy this configuration.

- fzf     : command line fuzzy finder
- dotbare : interactive dotfiles manager that rely on fzf

### Git

- detla : git diff syntax highlighter

## Installation

### Manual

```sh
dotbare ...

dotbare update-index --assume-unchanged README.md && rm README.md
```
