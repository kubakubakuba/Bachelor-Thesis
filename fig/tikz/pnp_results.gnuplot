# pnp_comparison_fixed.gnuplot - Robust version without tic errors
# set terminal pngcairo size 1200,800 enhanced font 'Verdana,12'
# set output 'distance_comparison.png'
set terminal tikz size 12cm,8cm
set output 'pnp_gnures.tex'

set datafile separator ","
set style fill transparent solid 0.5  # Makes bars semi-transparent (0.5 opacity)
set boxwidth 0.8
set key top left
set grid y

#set title "PnP Distance Estimation vs Ground Truth"
set xlabel "Recording"
set ylabel "Distance (m)"
set xtics rotate by -45

# Plot with black error bars and semi-transparent bars
plot "pnp_results.csv" using 0:4:5:xtic(2) with yerrorbars lc rgb "black" pt 7 ps 0 notitle, \
     "pnp_results.csv" using 0:4 with boxes lc rgb "#0091FF" fs transparent solid 0.5 title "Mean Estimated Distance", \
     "pnp_results.csv" using 0:3 with lines lw 2 lc rgb "red" title "Ground Truth"