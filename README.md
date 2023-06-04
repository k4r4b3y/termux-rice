# termux-rice
My rice of the android termux environment

## Features
- zshell setup with completions and user prompt setup
- tmux setup with comfy config (Ctrl + a , instead of Ctrl + b)
- colorful man pages (within tmux)
- automatically setups sshd and tor as termux-service and starts them
- automatically changes the tor SOCKSPort to 9055 (conflict prevention with orbot)
- automatically sets up a hidden service for ssh (${PREFIX}/var/lib/tor/ssh/)

Copy and paste the following in your termux window:

`sh -c "$(curl -fsSL https://github.com/k4r4b3y/termux-rice/raw/main/script)"`

```
█████████████████████████████████████████
█████████████████████████████████████████
████ ▄▄▄▄▄ █▀▄█▄▄▀▄▀ ▀ ▄▄█▀▄▄█ ▄▄▄▄▄ ████
████ █   █ █▀ █▀ ▀▀█▄▀ █ ▄  ▀█ █   █ ████
████ █▄▄▄█ █▀█▀▄ ██▀▀▀▀▄█▄▀▄ █ █▄▄▄█ ████
████▄▄▄▄▄▄▄█▄█▄█▄█ ▀ █▄▀▄▀ ▀ █▄▄▄▄▄▄▄████
████ ▄  ▄█▄▄▄ ▄▀█▄ ▄▀ █▀ █▄ ▀▄▀▄█▄▀▄▀████
█████ ▄▄██▄▄  ▀█ ▄ ▄▄█▄█▀ ▀▀▀▄▀█▀▄▀ █████
████▀ ▀██▀▄ ▄ ▀▀█ █▄▀  ▀▄▀ ▀█ ▀ ▄█▀▄ ████
████▄▀█ ▄▀▄█▀▄ █▀▄  ▄▄█▀▄ ▄█ ▀▀ ██ ██████
████▄▄▄ █▄▄█▄▀▀ ▄ ▄█▀▄█ ▀█▄▀█ █ ▄█▀█▀████
████ █▄▄  ▄█▀▄▄▀ █ ▄██▀▀  ██▄▀▀▄▀█▀██████
████  ▀▄▀▀▄███▀▀█▄▄▄ ▄▀ █▀ ▀█▄█▄▄▀▀█ ████
████ █ ██▀▄▄█ ▄▀▀█▀  ███   █▄▄▄ ▄█  ▀████
████▄█▄▄█▄▄█▀▀▀▀▄ ▄██▄█ ▀▀▄▀ ▄▄▄ ██▀▀████
████ ▄▄▄▄▄ █▄█▄▀▀█▀ █▄ ▀ ▀█  █▄█ ▀ ▄█████
████ █   █ █ ▄▀▀█ ▄█  ▀ ▀███ ▄▄▄ █▀▄▄████
████ █▄▄▄█ █  ▄▀█▄▄  ██▀▄▀▄███▄██ ▀▄█████
████▄▄▄▄▄▄▄█▄▄▄▄▄▄█▄▄▄████▄▄▄████▄█▄█████
█████████████████████████████████████████
█████████████████████████████████████████
```
