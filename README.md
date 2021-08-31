# DotConfig

Automatically updated and deployable configuration for my linux systems.

## Dependencies

- yadm
- zsh

## Installation

```sh
sudo apt install yadm zsh

yadm clone https://github.com/todorico/dotconfig.git
yadm checkout dell-xps
yadm bootstrap

sudo chsh -s "$(which zsh)"
```
