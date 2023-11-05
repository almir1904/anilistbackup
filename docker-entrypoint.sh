#!/bin/sh

# Set default values for environment variables
ANI=${ANI:-my_user}
MAL=${MAL:-}
TACHI=${TACHI:-}
AUTHENTICATE=${AUTHENTICATE:-false}
TRIM_LISTS=${TRIM_LISTS:-false}
SEPARATE_NSFW=${SEPARATE_NSFW:-false}
CLEAR_OUTPUT_FILES=${CLEAR_OUTPUT_FILES:-false}
USE_ANILIST_AS_MAL=${USE_ANILIST_AS_MAL:-false}

# Construct the command to run the Python script with the provided arguments and switches
command="python /app/AniPy/anipy.py -user '$ANI'"
[ -n "$MAL" ] && command="$command -mal '$MAL'"
[ -n "$TACHI" ] && command="$command -tachi '$TACHI'"
[ "$AUTHENTICATE" = "true" ] && command="$command --a"
[ "$TRIM_LISTS" = "true" ] && command="$command --t"
[ "$SEPARATE_NSFW" = "true" ] && command="$command --n"
[ "$CLEAR_OUTPUT_FILES" = "true" ] && command="$command --c"
[ "$USE_ANILIST_AS_MAL" = "true" ] && command="$command --m"

# Run the constructed command
eval "$command"

# You can add any other setup or startup logic here

# To keep the container running, you can use a sleep command
# sleep infinity

# You can also execute the CMD instruction from the Dockerfile if desired
exec "$@"