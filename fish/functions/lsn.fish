# call ls from nushell
function lsn --description 'ls from nushell'
    # Check if nushell is installed
    if test -x (which nu)
	# Call nushell with the arguments passed to this function
	nu -c "ls $argv"
    else
	echo "nushell is not installed."
    end
end
