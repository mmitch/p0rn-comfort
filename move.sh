#!/bin/sh
# $Id: move.sh,v 1.1 2004-11-20 12:58:12 mitch Exp $

rm -f out/*.1 out/*.2 out/*.html
(
    cd out
    mmv "*.JPG" "#1.jpg"
    mmv "*.Jpg" "#1.jpg"
    mmv "*.jpeg" "#1.jpg"
)

(
    mv out/*.jpg ~/download/xxx
    cd ~/download/xxx
    make
)

wait
