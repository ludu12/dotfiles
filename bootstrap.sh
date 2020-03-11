
# TODO : Delete symlinks to deleted files
link () {
	echo "$PROMPT This utility will symlink the files in this repo to the home directory"
	echo "$PROMPT Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\bootstrap.sh|\.git$|\.gitignore|.*.md' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		echo "$PROMPT Symlinking complete"
	else
		echo "$PROMPT Symlinking cancelled by user"
		return 1
	fi
}

link