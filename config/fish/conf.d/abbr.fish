# program abbrs
abbr vim nvim
abbr lg lazygit

# git
abbr gom "nvim (git status --short | awk '{print \$2}')"

# place abbrs
abbr dot "z dotfiles && nvim"

# command abbrs
abbr c clear
abbr cl clear
abbr claer clear
abbr clera clear
abbr , z

#better rm
abbr rm rip

# tmux
abbr tk "tmux kill-server"
abbr ta "tmux a"
abbr tat "tmux attach -t"
abbr td "t dotfiles"
abbr tn "tmux new -s (basename (pwd))"

# micromamba
abbr mam micromamba
abbr mc "micromamba create"
abbr ma "micromamba activate"
abbr md "micromamba deactivate"
abbr mae 'micromamba activate | fzf --query="$1" -m --preview "micromamba env list"'
abbr mi "micromamba install"
# man-style pages with tldr
abbr toolong "tldr --list | fzf --header 'I ain readin allat' --reverse --preview 'tldr {1}' --preview-window=right,80% | xargs tldr"


# buku - CLI Bookmarks Manager https://github.com/jarun/buku#usage
abbr b "buku --suggest"
abbr bs "buku --suggest -s"
abbr bS "buku --suggest -S"
abbr bst "buku --suggest --stag"
abbr bw "buku --suggest -w"

#pnpm
abbr pp pnpm

#homebrew
abbr update "brew outdated | fzf --multi --reverse | xargs brew upgrade"

# find files with neovim
abbr fo "fd --type f --hidden --ignore-file ~/.config/fd/vimignore | fzf | xargs nvim"

# nvim profile
abbr cvim "NVIM_APPNAME=nvim.fromscratch.bak nvim"

# codecrafters
abbr ccs "codecrafters submit"
abbr cct "codecrafters test"

# yazi
abbr e yazi
