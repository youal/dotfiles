create_kubectl_aliases() {
	verbs=(get describe explain)
	objects=(pod service deployment configmap secret)
	for verb in "${verbs[@]}"; do
		for object in "${objects[@]}"; do
			alias "k${verb:0:1}${object:0:1}=kubectl $verb $object"
		done
	done
}


create_kubectl_aliases

# When the number of arguments of printf is higher than what the format
# expects, printf will loop over the format.
# Because the precision is set to 0, no arguments is printed.
alias cline='printf "%.0s#" {1..80} ; echo'

alias sw='git switch $(git branch | fzf)'
