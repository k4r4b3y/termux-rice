#!/data/data/com.termux/files/usr/bin/sh
#
pkg upgrade -y -o Dpkg::Options::=--force-confnew 

mypacks="apt attr bash-completion bash binutils-bin binutils-libs \
         bzip2 ca-certificates command-not-found coreutils curl dash \
         debianutils dialog diffutils dos2unix dpkg ed file findutils ffmpeg \
         gawk gpgv grep gzip inetutils jq krb5 ldd ldns less libandroid-glob \
         libandroid-support libassuan libbz2 libc++ libcap-ng libcap libcrypt \
         libcurl libdb libedit libevent libexpat libgcrypt libgmp libgnutls \
         libgpg-error libiconv libidn2 liblz4 liblzma libmd libmpfr libnettle \
         libnghttp2 libnpth libpopt libqrencode libresolv-wrapper libsmartcols \
         libssh2 libtirpc libunistring libuuid lsof man nano ncurses net-tools \
         oniguruma openssh-sftp-server openssh openssl-tool openssl patch pcre2 \
         pcre procps psmisc python python-pip readline resolv-conf rsync runit sed tar \
         termux-am-socket termux-am termux-api termux-auth termux-exec \
         termux-keyring termux-licenses termux-services termux-tools tmux \
         tor torsocks tree unbound unzip util-linux vim-runtime vim wget \
         xxhash xz-utils ytfzf zlib zsh-completions zsh zstd"

pkg install -y $(echo ${mypacks})

# define the xdg dirs
cat << EOF >> ${PREFIX}/etc/profile
# set PATH so it includes user's private bin if it exists
if [ -d "\$HOME/bin" ] ; then
    PATH="\$HOME/bin:\$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "\$HOME/.local/bin" ] ; then
    PATH="\$HOME/.local/bin:\$PATH"
fi

# XDG Paths
export XDG_CONFIG_HOME="\${HOME}/.config"
export XDG_CACHE_HOME="\${HOME}/.cache"
export XDG_DATA_HOME="\${HOME}/.local/share"

# zsh config dir
export ZDOTDIR="\${HOME}/.config/zsh"
EOF

. ${PREFIX}/etc/profile

mkdir -p ${XDG_DATA_HOME}
mkdir -p ${XDG_CACHE_HOME}
mkdir -p ${XDG_CONFIG_HOME}
mkdir -p ${ZDOTDIR}

# create the zshell config files:
cat << EOF > ${ZDOTDIR}/.zshenv
# \${ZDOTDIR}/.zshenv

# zsh history
export HISTFILE="\${XDG_DATA_HOME}/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# text editor
export EDITOR="vi"

# proper LS_COLORS
# related to this problem with alacritty:
# https://github.com/alacritty/alacritty/issues/3705
# LS_COLORS taken from Whonix
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

# enable color support for less and man
export LESS_TERMCAP_mb=\$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=\$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=\$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=\$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=\$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=\$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=\$'\E[0m'        # reset underline

# for gnupg
# source: https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
GPG_TTY=\$(tty)
export GPG_TTY

EOF

cat << EOF > ${ZDOTDIR}/.zshrc
#!/data/data/com.termux/files/usr/bin/sh
# \${ZDOTDIR}/.zshrc

# ---OPTS---
# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
setopt hist_expire_dups_first hist_ignore_dups hist_verify
setopt numericglobsort magicequalsubst
setopt promptsubst
setopt printexitvalue

# use zsh dir stack
setopt auto_pushd pushd_ignore_dups pushd_silent

# ---SOURCES---
# completions
[ -f \${ZDOTDIR}/zsh_completions ] && source \${ZDOTDIR}/zsh_completions

# prompt
[ -f \${ZDOTDIR}/zsh_prompt ] && source \${ZDOTDIR}/zsh_prompt

# useful aliases
[ -f \${ZDOTDIR}/zsh_aliases ] && source \${ZDOTDIR}/zsh_aliases

# keybindings
[ -f \${ZDOTDIR}/zsh_keybindings ] && source \${ZDOTDIR}/zsh_keybindings

# enable syntax highligting from debian repos
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable autosuggestions from debian repos
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF

cat << EOF > ${ZDOTDIR}/zsh_aliases
# \${ZDOTDIR}/zsh_aliases

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
alias ls="ls -hN --color=auto --group-directories-first"
alias l="ls -la"

alias yt='yt-dlp --embed-metadata --ignore-errors --proxy "socks5://127.0.0.1:9055" --prefer-free-formats --restrict-filenames --format "((bestvideo[height<=?1080][vcodec^=vp9]/bestvideo)+(bestaudio[acodec=opus]/bestaudio[acodec=vorbis]/bestaudio[acodec=aac]/bestaudio))/best"'
alias yta='yt --extract-audio --audio-format "opus"'
alias ytt="yt --skip-download --write-thumbnail"

alias yg='bash -c "\$(curl -fsSL https://github.com/k4r4b3y/yolgezer/raw/main/src/install-monerod-in-termux.sh)"'
EOF

cat << EOF > ${ZDOTDIR}/zsh_completions
# \${ZDOTDIR}/zsh_completions

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents 'parent pwd directory'
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' list-colors "\${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# https://reddi.tk/r/zsh/comments/w9r0a7/tab_autocompletion_dont_work_on_environment/
zstyle ':completion:*' fake-parameters PREFIX

autoload -Uz compinit
zmodload zsh/complist
compinit -u -d \${XDG_CACHE_HOME}/.zcompdump
#_comp_options+=(globdots)
EOF

cat << EOF > ${ZDOTDIR}/zsh_keybindings
# \${ZDOTDIR}/zsh_keybindings

# ^  - Represent the CTRL key. For example: ^c for CTRL+c.
# \e - Represent the ALT key. For example: \ec for ALT+c.

# enable vi mode
bindkey -v
export KEYTIMEOUT=1

# standard keys
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^D' delete-char-or-list
bindkey -M viins '^E' end-of-line
bindkey -M viins '^F' forward-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^J' accept-search 2>/dev/null
bindkey -M viins '^K' kill-line
bindkey -M viins '^L' clear-screen
bindkey -M viins '^M' accept-line
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
bindkey -M viins '^T' transpose-chars
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^Y' yank
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^_' undo
bindkey -M viins ' ' magic-space

# move words with control and arrow keys
bindkey -M viins '^[[1;5D' backward-word
bindkey -M viins '^[[1;5C' forward-word

# use Ctrl + a to increase a number on cli
autoload -Uz incarg
zle -N incarg
bindkey -M vicmd '^A' incarg

# completion menu vi-keys nav
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Change cursor shape for different vi modes.
zle-keymap-select zle-line-init() {
  # Check ~/.st/config.h for the cursor escape sequences.
  case \$KEYMAP in
    vicmd)      print -n -- "\e[2 q";;
    viins|main) print -n -- "\e[5 q";;
  esac

  zle reset-prompt
  zle -R
}

zle-line-finish() {
  print -n -- "\e[2 q"
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# when in command mode hit Ctrl + v to edit the command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line
EOF

cat << EOF > ${ZDOTDIR}/zsh_prompt
# \${ZDOTDIR}/zsh_prompt

# autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# enable only git 
zstyle ':vcs_info:*' enable git 

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ \$(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in \$PWD, use:
        #[[ -n \$(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{\$fg[blue]%}(%{\$fg[red]%}%m%u%c%{\$fg[yellow]%}%{\$fg[magenta]%} %b%{\$fg[blue]%})"

# format our main prompt for hostname current folder, and permissions.
PROMPT="%B%{\$fg[blue]%}[%{\$fg[white]%}%n%{\$fg[red]%}@%{\$fg[white]%}%m%{\$fg[blue]%}]%{\$fg_bold[red]%}:%{\$fg[cyan]%}%~ %{\$reset_color%}%#"
#PROMPT="%{\$fg[green]%}%n@%m:%~ %{\$reset_color%}%# "
PROMPT+="\$vcs_info_msg_0_ "
# TODO look into this for more colors
# https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# also ascii escape codes
EOF

# change the user shell to zshell
chsh -s zsh

cat << EOF > ${HOME}/.tmux.conf
# create the tmux config file
#
# Setting the prefix from CTRL-b (C-b)
# to CTRL-a (C-a)
# the -g switch stands for "global"
# meaning, the option is set for 
# all tmux sessions.
set -g prefix C-a

# Free the original CTRL-b prefix 
# keybinding
unbind C-b

# Setting the delay between
# prefix and command
set -s escape-time 1

# Setting a keybinding
# for re-sourcing the 
# .tmux.fonf file
bind r source-file ~/.tmux.conf \; display "Conf file Reloaded!"

# Allowing other programs
# running in a tmux session
# to access the Ctrl-a
# this way, you can send
# C-a to an application running
# within tmux simply by
# pressing C-a twice.
bind C-a send-prefix

# Splitting panes with | and -
bind | split-window -h
bind - split-window -v

# Moving between the panes
# using h j k l
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Quick window selection
# -r flag makes the binding
# key repeatable.
# no need to press PREFIX
# before repeating these bindings.
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# Resizing the panes
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Mouse support OFF
# set to on, if you want
# to use the mouse.
set -g mouse off

# Set the default terminal mode 
# to 256color mode
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",\$TERM:RGB"

# Set colors for the active window
setw -g window-status-current-style fg=white,bold,bg=red

# Colors for pane borders
setw -g pane-border-style fg=green,bg=black
setw -g pane-active-border-style fg=white,bg=yellow

# Dim inactive panes
#setw -g window-style fg=colour240,bg=colour235
#setw -g window-active-style fg=white,bg=black

# Command / message line
set -g message-style fg=white,bold,bg=black

# Status line left side to show 
# Session:window:pane
set -g status-left-length 40
set -g status-left "#[fg=black]session: #S #[fg=black]window: #I #[fg=black]pane: #P"

# Center the window list in the status line
set -g status-justify centre

# Enable activity alerts
setw -g monitor-activity on
set -g visual-activity on

# Enable vi keys
setw -g mode-keys vi

# Enable vim-like keybindings
# for the Copy mode
bind Escape copy-mode
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection
unbind p
bind p paste-buffer

# To copy the current buffer 
# to the system clipboard
# This configures PREFIX CTRL-C
# to get your text on the clipboard
# Enter Copy mode.
# Select your text, press y,
# and then press PREFIX CTRL-C
# to get your text on the clip board
bind C-c run "tmux save-buffer - | xclip -i -sel clipboard"

# Bind the y key to send the output to xlip
bind-key -T copy-mode-vi y  send-keys -X copy-pipe-and-cancel "xclip -sel clip -i"

# Prefix Ctrl-v fills tmux buffer from system clipboard via xclip, then
# pastes from buffer into tmux window
bind C-v run "tmux set-buffer \"\$(xclip -sel clip -o)\"; tmux paste-buffer"
EOF

sv-enable sshd

cat << EOF >> ${PREFIX}/etc/tor/torrc
SOCKSPort 9055 
HiddenServiceDir /data/data/com.termux/files/usr/var/lib/tor/ssh/
HiddenServicePort 22 127.0.0.1:8022
EOF

mkdir -p /data/data/com.termux/files/usr/var/lib/tor/ssh/
sv-enable tor

# install python and pipx
python -m pip install --user pipx

# install yt-dlp and ytfzf
pipx install yt-dlp

# create ytfzf config file
mkdir -p ${XDG_CONFIG_HOME}/ytfzf
cat << EOF > ${XDG_CONFIG_HOME}/ytfzf/conf.sh
ytdl_opts='--embed-metadata --ignore-errors --prefer-free-formats --restrict-filenames --proxy socks5://127.0.0.1:9055 --format ""bestvideo[height<=?1080][vcodec^=vp9]+bestaudio/best""'
video_pref="((bestvideo[height<=?1080][vcodec^=vp9]/bestvideo))"
audio_pref="((bestaudio[acodec=opus]/bestaudio[acodec=vorbis]/bestaudio[acodec=aac]/bestaudio))"
EOF

# symlink yt-dlp to youtube-dl so ytfzf doesn't complain
ln -s $(whereis yt-dlp) ${PREFIX}/bin/youtube-dl
