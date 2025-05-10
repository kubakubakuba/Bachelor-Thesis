#set terminal pngcairo enhanced font "Arial,12" size 800,600
#set output "_new_lambertian.png"
set terminal tikz size 12cm,8cm
set output '_new_lambertian_gnu.tex'

#set title "Angular Displacement vs Relative Intensity"
set xlabel "Angular Displacement (degrees)"
set ylabel "Relative Intensity"

set xrange [-90:90]
set yrange [0:1.1]

set grid
set key top right

set style line 1 lc rgb '#0091ff' lt 1 lw 2 pt 7 ps 0.5  # line style

plot './data/lambertian.csv' using 1:2 with linespoints ls 1 title "Intensity Profile"