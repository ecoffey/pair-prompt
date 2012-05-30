PAIR_PROMPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pair_prompt() {
	if [ -f .pairs ]; then
		local fmt="(%s)"
		if [ -n "$1" ]; then
			fmt="$1"
		fi
		local email=$(git config --get user.email)
		local abbrevs=$(ruby $PAIR_PROMPT_DIR/pair_abbrev_from_email.rb $email)
		printf -- "$fmt" "$abbrevs"
	fi
}
