set -gx GEM_HOME ~/.gems

if test -d "/usr/local/opt/ruby/bin"
  set -gx PATH /usr/local/opt/ruby/bin $PATH
end

set -gx PATH (gem environment gemdir)/bin $PATH (ruby -e 'puts Gem.user_dir')/bin ~/.gems/bin

