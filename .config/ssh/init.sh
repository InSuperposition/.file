# # Auto-unlock keychain for SSH + Zellij compatibility
# if [[ -n "$SSH_CONNECTION" ]]; then
# 		# Check if locked (security returns non-zero if interaction is required/locked)
# 		if ! security show-keychain-info ~/Library/Keychains/login.keychain-db >/dev/null 2>&1; then
# 				echo "🔐 Unlocking Keychain for SSH session..."
# 				echo "You may be prompted for your password."
# 				security unlock-keychain ~/Library/Keychains/login.keychain-db
# 		fi
# fi

alias unlock-keychain='echo "🔐 Enter password for keychain unlock:" && security unlock-keychain ~/Library/Keychains/login.keychain-db && echo "🔓 Keychain unlocked."'