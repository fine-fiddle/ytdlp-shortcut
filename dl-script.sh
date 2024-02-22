#! /bin/zsh

# set -e
# set -o pipefail

LOGFILE="/tmp/ytdlp_shortcut.log";

if [[ -n "$SSH_ORIGINAL_COMMAND" ]]; then
  CLIPTYPE=$(echo "$SSH_ORIGINAL_COMMAND" | awk '{print $2}' | tr -d "\"";);
  CLIPURL=$(echo "$SSH_ORIGINAL_COMMAND" | awk '{print $3}' | tr -d "\"";);
else
  CLIPTYPE="$1";
  CLIPURL="$2";
fi

SAVEPATH="/Volumes/media/movies_clips/$CLIPTYPE";
#for testing locally# SAVEPATH="./$CLIPTYPE";

echo "-----\n$(date)" >> $LOGFILE;
echo -n "parameters = ";
printf '%s\n' "$*" >> $LOGFILE;
echo "clip type = $CLIPTYPE" >> $LOGFILE;
echo "ssh orig command = $SSH_ORIGINAL_COMMAND" >> $LOGFILE;
echo "clip url = $CLIPURL" >> $LOGFILE;
echo "savepath = $SAVEPATH" >> $LOGFILE;

if [[ ! -d "$SAVEPATH" ]]; then
  mkdir "$SAVEPATH";
fi

cd "$SAVEPATH";


if [[ "$CLIPURL" == *"tiktok"* ]]; then
  $(cd "$SAVEPATH"; /opt/homebrew/bin/yt-dlp --no-progress --no-mtime -o "@%(uploader)s_%(upload_date)s_%(title.:100)s_%(id)s.%(ext)s" $CLIPURL &>> $LOGFILE;) &
else 
  $(cd "$SAVEPATH"; echo "begin yt-dlp" >> $LOGFILE; /opt/homebrew/bin/yt-dlp --no-progress --no-mtime "$CLIPURL" &>> $LOGFILE;) &
fi


exit 0;
