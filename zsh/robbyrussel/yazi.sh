_YAZI_ZSH=""
if [ -n "$YAZI_LEVEL" ]; then
	_YAZI_ZSH='%{$fg[magenta]%}| Yazi  %{$reset_color%}'
fi
PS1="$PS1$_YAZI_ZSH"
