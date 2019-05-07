set -g theme_display_git_dirty yes
set -g theme_display_git_master_branch yes
set -g theme_nerd_fonts yes

set -gx EDITOR (which nvim)

if test -d ~/bin
    set -gx PATH $PATH ~/bin
end

if test -d ~/Android/Sdk/platform-tools
    set -gx PATH $PATH ~/Android/Sdk/platform-tools
end

if test -d ~/Android/Sdk/tools
    set -gx PATH $PATH ~/Android/Sdk/tools
end

if test -d /opt/android-sdk
    set -gx PATH $PATH /opt/android-sdk/platform-tools /opt/android-sdk/tools
end

if test -d /opt/android-studio/gradle/gradle-5.1.1/bin
    set -gx PATH $PATH /opt/android-studio/gradle/gradle-5.1.1/bin
end

set gemdir (ruby -e 'puts Gem.user_dir')/bin
if test -d $gemdir
    set -gx PATH $PATH $gemdir
end

set yarndir (yarn global bin)
if test -d $yarndir
    set -gx PATH $PATH $yarndir
end

if test -d ~/dotfiles/bin
    set -gx PATH $PATH ~/dotfiles/bin
end

set -gx PATH $PATH $NPM_PACKAGES/bin

if test -d ~/flutter/bin
    set -gx PATH $PATH ~/flutter/bin ~/flutter/bin/cache/dart-sdk/bin
end

set GOPATH ~/.gocode
set GOBIN $GOPATH/bin

set -gx ELECTRON_TRASH trash-cli

alias vim "nvim -p"

alias dokku "ssh dokku@dokku --"

alias git-blame-count "git ls-tree --name-only -z -r HEAD|egrep -z -Z -E '\.(cc|h|cpp|hpp|c|txt|html|js|css|xml)\$'|xargs -0 -n1 git blame --line-porcelain|grep '^author '|sort|uniq -c|sort -nr|sed 's/author/lines authored by/'"

alias nodepath "set PATH $PATH ./node_modules/.bin"

