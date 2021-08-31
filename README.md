# DotConfig

Automatically updated and deployable configuration for my linux systems.

## Dependencies

- yadm
- zsh

## Installation

```sh
sudo apt install yadm zsh
sudo chsh -s "$(which zsh)"

yadm clone git@github.com:todorico/dotconfig.git
yadm checkout dell-xps
yadm bootstrap

zsh
```
