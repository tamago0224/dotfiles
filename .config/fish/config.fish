# env
set -g GTK_TM_MODULE fcitx
set -g QT_TM_MODULE fcitx
set -g XMODIFIERS @im=fcitx
set -g DefaultIMModule fcitx

set -g DENO_INSTALL $HOME/.deno

set -g GOPATH $HOME/go
# set -g GOROOT (go1.23.4 env GOROOT)

# path
fish_add_path $HOME/go/bin
fish_add_path $DENO_INSTALL/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $GOROOT/bin
fish_add_path /opt/nvim/bin
fish_add_path /mnt/c/Users/bigtr/AppData/Local/Programs/Kiro/bin/kiro

# theme
set -g theme_display_git_master_branch yes
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_color_scheme darcula
set -g theme_display_date yes
set -g theme_display_cmd_duration yes

# vagrant for wsl
set -Ux VAGRANT_WSL_ENABLE_WINDOWS_ACCESS "1"
set -Ux VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH /home/tamago
set -Ux VAGRANT_WSL_WINDOWS_ACCESS_USER tamago
set -Ux fish_user_paths $fish_user_paths /mnt/c/Program\ Files/Oracle/VirtualBox/

# abbr
abbr --add k kubectl
abbr --add d docker
abbr --add dc docker compose
abbr --add g git

# kubectl completion
#kubectl completion fish | source

# aliases
alias vi=nvim

set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path $VOLTA_HOME/bin


# bun
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL

# mise
/usr/bin/mise activate fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
