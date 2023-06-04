# termux-rice
My rice of the android termux environment

Tips (XMR):
```
85qdAJqpHWTFPR2FnJQJY5MxMYzQh58apd9PbiSgKGjAMy9Mx5VGp1yS5r83S8c1p7hiCFH2uE3m8bAr5PxrGHNm63PReuP
```
<center> 
<figure>
<img src="pics/xmrqr.webp" width="100">
</figure>
</center>

## Features
- zshell setup with completions and user prompt setup
- tmux setup with comfy config (Ctrl + a , instead of Ctrl + b)
- colorful man pages (within tmux)
- automatically setups sshd and tor as termux-service and starts them
- automatically changes the tor SOCKSPort to 9055 (conflict prevention with orbot)
- automatically sets up a hidden service for ssh (${PREFIX}/var/lib/tor/ssh/)

Copy and paste the following in your termux window:

```
sh -c "$(curl -fsSL https://github.com/k4r4b3y/termux-rice/raw/main/src/termux-rice.sh)"
```

<center> 
<figure>
<img src="pics/qr-code.webp" width="400">
<figcaption>Scan to copy the oneliner to paste in your termux!</figcaption>
</figure>
</center>

