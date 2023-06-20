#!/usr/bin/env fish

mkdir -p img
convert img-raw/Cru-Logo_rgb-01.png -transparent white img/cru.png
convert img-raw/DSC00391.jpg -crop 3266x3266+650+0 img/texas.jpg
convert img-raw/IMG_20210301_211734.jpg -crop 3920x1960+0+0 img/1.jpg
convert img-raw/IMG_5737.JPG -crop 2450x1400+30+0 img/2.jpg
convert img-raw/e2888b055fb67b5e2020b87d9f008e5d3821c011-14.jpg -crop 1150x575+0+0 img/3.jpg

set PORT 4000
npx --yes serve -p $PORT &
set server_pid $last_pid
mkdir -p dist
npx --yes capture-website-cli http://localhost:$PORT/page-1.svg --output dist/page-1.png --overwrite --no-block-ads
npx --yes capture-website-cli http://localhost:$PORT/page-2.svg --output dist/page-2.png --overwrite --no-block-ads
convert dist/page-1.png dist/page-2.png "dist/Leaving piece.pdf"
montage dist/page-1.png dist/page-1.png dist/page-1.png dist/page-1.png -tile 2x2 -geometry 3300x2250 dist/page-1-2x2.png
montage dist/page-2.png dist/page-2.png dist/page-2.png dist/page-2.png -tile 2x2 -geometry 3300x2250 dist/page-2-2x2.png
kill $server_pid
