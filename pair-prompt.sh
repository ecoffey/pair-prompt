PAIR_PROMPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pair_prompt() {
	if [ -f .pairs ]; then
		local fmt="(%s)"
		if [ -n "$1" ]; then
			fmt="$1"
		fi
		local email=$(git config --get user.email)
		if [ -n "$email" ]; then
			local abbrevs=$(ruby $PAIR_PROMPT_DIR/pair_abbrev_from_email.rb $email)
			printf -- "${fmt:-}" "$abbrevs"
		else
			printf -- "${fmt:-}" "NO AUTHOR"
		fi
	fi
}
