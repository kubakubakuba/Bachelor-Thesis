set terminal tikz size 12cm,8cm
set output 'experiment_analysis_gnu.tex'

set title 'Estimated Distance vs Ground Truth'
set xlabel 'Detection Index'
set ylabel 'Distance (meters)'
set grid

set datafile separator ','

csv_file = 'uav33_points_analysis.csv'

stats csv_file using 6 nooutput

plot csv_file using 1:4:6 title 'Estimated Distance' with errorbars, \
     csv_file using 1:4 title 'Estimated Distance Line' with lines, \
     csv_file using 1:5 title 'Ground Truth' with lines

unset output

set terminal tikz size 12cm,8cm
set output 'experiment_analysis_whiskers_gnu.tex'

set title 'Estimated Distance vs Ground Truth'
set xlabel 'Detection Index'
set ylabel 'Distance (meters)'
set grid

plot csv_file using 1:4 title 'Estimated Distance Line' with lines, \
     csv_file using 1:5 title 'Ground Truth' with lines

unset output
