#!/usr/bin/env fish

mkdir -p img
convert img-raw/cru_logo_screen.jpg -transparent white img/cru.png
convert img-raw/DSC00391.jpg -crop 3266x3266+650+0 img/texas.jpg
convert img-raw/IMG_20210301_211734.jpg -crop 3920x1960+0+0 img/1.jpg
convert img-raw/IMG_5737.JPG -crop 2450x1400+30+0 img/2.jpg
convert img-raw/e2888b055fb67b5e2020b87d9f008e5d3821c011-14.jpg -crop 1150x575+0+0 img/3.jpg
