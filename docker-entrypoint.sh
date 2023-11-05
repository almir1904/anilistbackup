#!/bin/sh

# Set default values for environment variables
MAL=${MAL:-}
TACHI=${TACHI:-}
AUTHENTICATE=${AUTHENTICATE:-false}
TRIM_LISTS=${TRIM_LISTS:-false}
SEPARATE_NSFW=${SEPARATE_NSFW:-false}
CLEAR_OUTPUT_FILES=${CLEAR_OUTPUT_FILES:-false}
USE_ANILIST_AS_MAL=${USE_ANILIST_AS_MAL:-false}

TACHI_PATH=
if [ "$TACHI" = "true" ]; then
    TACHI_PATH="/app/AniPy/tachiyomi-backup.xml"
fi


command="python /app/AniPy/anipy.py -user '$ANI'"
[ -n "$MAL" ] && command="$command -mal '$MAL'"
[ -n "$TACHI" ] && command="$command -tachi '$TACHI'"
[ "$TRIM_LISTS" = "true" ] && command="$command --t"
[ "$SEPARATE_NSFW" = "true" ] && command="$command --n"
[ "$CLEAR_OUTPUT_FILES" = "true" ] && command="$command --c"
[ "$USE_ANILIST_AS_MAL" = "true" ] && command="$command --m"

eval "$command"

exec "$@"