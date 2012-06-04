PAIR_PROMPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pair_prompt() {
	tmp=$(git status > /dev/null 2>&1)
	if [ "$?" == "0" ]; then
		local email=$(git config --get user.email)
		local fmt="(%s)"
		if [ -n "$1" ]; then
			fmt="$1"
		fi

		if [ -n "$email" ]; then
			if [ -f .pairs ]; then 
				if [ "$email" == pair* ]; then
					local abbrevs=$(ruby $PAIR_PROMPT_DIR/pair_abbrev_from_email.rb $email)
					printf -- "${fmt:-}" "$abbrevs"
				else
					printf -- "${fmt:-}" "$email"
				fi
			else
				printf -- "${fmt:-}" "$email"
			fi
		else
			printf -- "${fmt:-}" "NO AUTHOR"
		fi
	fi
}
