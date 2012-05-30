A simple shell function to display the current pair abbrevations from .pairs

Usage:
------

`cd ~ && git clone http://github.com/ecoffey/pair-prompt.git .pair-prompt`

And then add this to your `.bashrc`:

`[[ -s "<HOME>/.pair-prompt/pair-prompt.sh" ]] && source "<HOME>/.pair-prompt/pair-prompt.sh"`

Where `<HOME>` is your expanded $HOME path.

And then finally add this to somewhere pleasing in your PS1:

`$(pair_prompt)`
