set -x LANG en_GB.UTF-8
set -x LC_ALL en_GB.UTF-8
set -g theme_display_git_dirty yes
set -g theme_display_git_master_branch yes
set -g theme_nerd_fonts yes

set -gx EDITOR (which nvim)

# This is separate since it needs to be prepended to the path
set -l gnubin_path /usr/local/opt/coreutils/libexec/gnubin
if test -d $gnubin_path
    set -gx PATH $gnubin_path $PATH
end

set -l yarndir (yarn global bin)

set -l path_locations = \
    ~/bin \
    ~/.local/bin \
    ~/dotfiles/bin \
    ~/Android/Sdk/platform-tools \
    ~/Android/Sdk/tools \
    ~/Library/Android/sdk/platform-tools \
    ~/Library/Android/sdk/tools \
    /opt/android-sdk \
    /opt/android-studio/gradle/gradle-5.1.1/bin \
    $yarndir \
    ~/dotfiles/bin \
    $NPM_PACKAGES/bin \
    ~/.cargo/bin \
    ~/.pub-cache/bin \
    ~/fvm/default/bin


for path_loc in $path_locations
    if test -d $path_loc
        set -gx PATH $PATH $path_loc
    end
end

set GOPATH ~/.gocode
set GOBIN $GOPATH/bin

set -gx ELECTRON_TRASH trash-cli

alias vim "nvim -p"

alias dokku "ssh dokku@dokku --"

alias git-blame-count "git ls-tree --name-only -z -r HEAD|egrep -z -Z -E '\.(cc|h|cpp|hpp|c|txt|html|js|css|xml)\$'|xargs -0 -n1 git blame --line-porcelain|grep '^author '|sort|uniq -c|sort -nr|sed 's/author/lines authored by/'"

alias nodepath "set PATH $PATH ./node_modules/.bin"

#alias ssh "kitty +kitten ssh"
alias icat "kitty +kitten icat"

alias k "kubectl"
alias kn "kubectl config set-context --current --namespace"


alias flutter "fvm flutter"
alias dart "fvm dart"
