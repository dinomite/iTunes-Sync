#!/bin/bash
# itunes_sync.sh
#
# Sync an iTunes library—music and all—from one Mac to another
REMOTE_HOST="OTHER_COMPUTER_IP"

RSYNC_OPTIONS="-a --delete --progress --recursive --perms --times --whole-file --rsh=ssh --exclude='*.DS_Store'"

# You probably just need to change the username here
REMOTE_ITUNES_DIR="/Users/dinomite/Music/iTunes"
LOCAL_ITUNES_DIR="/Users/dinomite/Music/iTunes"

# The library file itself gets copied wholesale
#scp "$REMOTE_HOST:$REMOTE_ITUNES_DIR/iTunes\ Library" $LOCAL_ITUNES_DIR/
# Album Artwork
rsync $RSYNC_OPTIONS --exclude='Cache/*'\
    "$REMOTE_HOST:$REMOTE_ITUNES_DIR/Album\ Artwork/" \
    "$LOCAL_ITUNES_DIR/Album Artwork/"
# Mobile Applications
rsync $RSYNC_OPTIONS \
    "$REMOTE_HOST:$REMOTE_ITUNES_DIR/Mobile\ Applications/" \
    "$LOCAL_ITUNES_DIR/Mobile Applications/"
# The actual music
rsync $RSYNC_OPTIONS \
    "$REMOTE_HOST:$REMOTE_ITUNES_DIR/iTunes\ Music/" \
    "$LOCAL_ITUNES_DIR/iTunes Music/"
