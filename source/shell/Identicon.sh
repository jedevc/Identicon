#!/bin/bash

# canvas settings
squares=5
size=20
canvas=$(( $squares * $size ))

mirror=$(( $squares / 2 + 1 ))

# random seeding
if [[ -n $1 ]]; then
    RANDOM=$1
fi

# color generation
red=$(( RANDOM % 256 ))
green=$(( RANDOM % 256 ))
blue=$(( RANDOM % 256 ))
color="rgb($red, $green, $blue)"

# svg generation
echo "<svg viewBox='0 0 $canvas $canvas' xmlns='http://www.w3.org/2000/svg'>"
echo "<rect x='0' y='0' width='$canvas' height='$canvas' fill='#fff' />"
for i in `seq 0 $(( $mirror - 1 ))`; do
    for j in `seq 0 $(( $squares - 1 ))`; do
        if [[ $(( RANDOM % 2 )) -eq 0 ]]; then
            x=$(( $i * $size ))
            y=$(( $j * $size ))

            echo "<rect x='$x' y='$y' width='$size' height='$size' fill='$color' />"
            if [[ $i -ne $(( $mirror - 1 )) ]]; then
                altx=$(( ($squares - $i - 1) * $size ))
                echo "<rect x='$altx' y='$y' width='$size' height='$size' fill='$color' />"
            fi
        fi
    done
done
echo "</svg>"
