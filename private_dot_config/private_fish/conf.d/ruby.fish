if test -d "/opt/homebrew/opt/ruby/bin"
    set -gx GEM_HOME ~/.gems
    set -gx PATH /opt/homebrew/opt/ruby/bin $PATH
    set -gx PATH $PATH (gem environment gemdir)/bin
end


