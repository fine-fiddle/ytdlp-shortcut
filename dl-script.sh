#! /bin/zsh

# set -e
# set -o pipefail

LOGFILE="/tmp/ytdlp_shortcut.log";
CLIPTYPE="$1";
CLIPURL="$2";
SAVEPATH="/Volumes/media/movies_clips/$CLIPTYPE";
#for testing locally# SAVEPATH="./$CLIPTYPE";

echo "---$(date)---" >> $LOGFILE;
printf '%s\n' "$*" >> $LOGFILE;
echo "clip type = $CLIPTYPE" >> $LOGFILE;
echo "clip url = $CLIPURL" >> $LOGFILE;
echo "savepath = $SAVEPATH" >> $LOGFILE;

if [[ ! -d "$SAVEPATH" ]]; then
  mkdir "$SAVEPATH";
fi

cd "$SAVEPATH";


if [[ "$CLIPURL" == *"tiktok"* ]]; then
  $(cd "$SAVEPATH"; /opt/homebrew/bin/yt-dlp --no-progress --no-mtime -o "@%(uploader)s_%(upload_date)s_%(title.:100)s_%(id)s.%(ext)s" $CLIPURL >> $LOGFILE &;);
else 
  $(cd "$SAVEPATH"; opt/homebrew/bin/yt-dlp --no-progress --no-mtime "$CLIPURL" >> $LOGFILE &;);
fi

echo "------" >> $LOGFILE;

exit 0;
