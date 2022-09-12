[[ $(uname) = "Linux " ]] && setxkbmap -option ctrl:nocaps

# When the number of arguments of printf is higher than what the format
# expects, printf will loop over the format.
# Because the precision is set to 0, no arguments is printed.
alias cline='printf "%.0s#" {1..80} ; echo'

alias sw='git switch $(git branch | fzf)'
