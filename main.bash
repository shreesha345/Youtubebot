!bin/bash
youtube-dl $(curl -s -H " User-agent: 'your bot 0.1 " https://www.reddit.com/r/TikTokCringe/hot.json?limit=12 |
jq '.' | grep url_overridden_by_dest | grep -Eoh "https:\/\/v\.redd\.it\/\w{13}")
for f in *.mp4;
do
  ffmpeg -1 $f -lavfi '[0:v]scale-ih*16/9:-1,boxblur=luma_radius=min(h\,w)/20:Luma_power=1 :chroma_radius(cw
\,ch)/20:chroma_power=1[bg];[bg][8:v]overlay=(W-w)/2:(H-h)/2,crop=h=iw*9/16 -vb 800k blur/$f ;
done

rm *.mp4
for f in blur/*.mp4; do echo "file $f" >> file_list.txt ; done
ffmpeg -f concat -i file_list.txt final.mp4
rm -rf blur

python /upload.py --file="final.mp4" --title=" Funny TikTok Compilation #1" --description="
my merchandise - spamlink.ly" --keywords="tiktok, cringe" --category="22" --privacy Status="public"
