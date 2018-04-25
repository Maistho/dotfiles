set -g theme_display_git_dirty yes
set -g theme_display_git_master_branch yes
set -g theme_nerd_fonts yes

if test -d ~/bin
    set -gx PATH $PATH ~/bin
end

if test -d /opt/android-sdk
    set -gx PATH $PATH /opt/android-sdk/platform-tools /opt/android-sdk/tools
end

if test -d /opt/android-studio/gradle/gradle-*/bin
    set -gx PATH $PATH /opt/android-studio/gradle/gradle-*/bin
end

set gemdir (ruby -e 'puts Gem.user_dir')/bin
if test -d $gemdir
    set -gx PATH $PATH $gemdir
end

set -gx PATH $PATH $NPM_PACKAGES/bin

set GOPATH ~/.gocode
set GOBIN $GOPATH/bin

set -gx ELECTRON_TRASH trash-cli

alias vim "nvim -p"

alias dokku "ssh dokku@dokku --"

alias git-blame-count "git ls-tree --name-only -z -r HEAD|egrep -z -Z -E '\.(cc|h|cpp|hpp|c|txt|html|js|css|xml)\$'|xargs -0 -n1 git blame --line-porcelain|grep '^author '|sort|uniq -c|sort -nr|sed 's/author/lines authored by/'"

alias nodepath "set PATH $PATH ./node_modules/.bin"

alias code "code --force-gpu-rasterization=true"

