#!/bin/bash

CONFIG=$(dirname $0)/maillists
RESULT=maillists.generate
FOLDER_HOOK=folder-hooks.maillist

die() {
	echo $1
	exit 1
}

add_maillist() {
	email=$1
	mailbox=$2

	echo "# email: $email"
	echo "# mailbox: $mailbox"

	# Subscription
	echo "subscribe $email"
	# Mailboxes
	echo "mailboxes \"$mailbox\""
	# Folder hook
	echo "folder-hook \"$mailbox\" source $FOLDER_HOOK"
	# FCC hook
	echo "fcc-hook $email \"$mailbox\""

	printf "\n\n"
}

test -f "$CONFIG" || die "Config file ($RESULT) not exists."

echo "# Generate date: $(date)" > "$RESULT" || die "Can't write file ($RESULT)."
echo "# vim: ft=muttrc :" >> "$RESULT"

while read email mailbox
do
	if [[ -n "$email" ]]
	then
		if [[ "$(echo $email | sed 's/^\s*#//')" == "$email" ]]
		then
			add_maillist $email $mailbox >> "$RESULT"
		fi
	fi
done < "${CONFIG}"
