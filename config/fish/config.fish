if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    atuin init fish --disable-up-arrow | source
end

set -Ux EDITOR nvim
set -Ux STARSHIP_CONFIG ~/.config/starship/starship.toml
set -Ux fish_greeting #disable fish greeting
set -Ux fish_key_bindings fish_vi_key_bindings
set -gx XDG_DATA_HOME $HOME/.local/share
# set -Ux VOLTA_HOME $HOME/.volta
# set -Ux VOLTA_FEATURE_PNPM 1 #enable volta pnpm support
# set -x DYLD_FALLBACK_LIBRARY_PATH "$(xcode-select --print-path)/usr/lib/"

#for image.nvim

#fish_add_path /opt/homebrew/bin
#fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
#fish_add_path $HOME/.cargo/bin
#fish_add_path $HOME/go/bin
#fish_add_path $HOME/Library/Python/3.11/bin
#fish_add_path $HOME/code/scripts

fish_default_key_bindings

alias ls "eza --icons --group-directories-first --sort type --color always"


# opam configuration
#source /Users/cameronmalone/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

#source /opt/homebrew/opt/asdf/libexec/asdf.fish
