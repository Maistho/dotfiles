set -l fvm_path ~/fvm/default/bin
if test -d $fvm_path
    set -gx PATH $PATH $fvm_path
end

alias flutter "fvm flutter"
alias dart "fvm dart"
