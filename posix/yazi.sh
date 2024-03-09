YAZI_TERM=""
if [ -n "$YAZI_LEVEL" ]; then
	YAZI_TERM="|  Yazi terminal: "
fi
PS1="$PS1$YAZI_TERM"
