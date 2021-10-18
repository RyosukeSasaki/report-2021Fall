reset
#set terminal wxt
oname = "../graph/nopipe/all.tex"
set terminal tikz size 12cm, 20cm
set output oname
set size square

set xlabel "Time / sec"
set ylabel "Pressure $10^{-3}$/$\\si{\\pascal}$"

set yrange [0:10]
set ytics 0,5,10
set mytics 5
set multiplot layout 3, 2
unset key

fname = "nopipe/nopipe_P-vs-T_1.dat"
x_start = 180
set xrange [x_start:x_start+80]
set xtics x_start,20,x_start+80
set mxtics 2
fit_begin=189.5
fit_end=260
a=7
b=fit_begin
c=5
d=1
f(x) = a*exp(-(x-b)/c)+d
fit [fit_begin:fit_end] f(x) fname via a,b,c,d
plot fname every 1 notitle lt 22 ps 1.5,\
    f(x) notitle lc 2

fname = "nopipe/nopipe_P-vs-T_2.dat"
x_start = 130
set xrange [x_start:x_start+80]
set xtics x_start,20,x_start+80
set mxtics 2
fit_begin=139.5
fit_end=190
a=7
b=fit_begin
c=5
d=1
f(x) = a*exp(-(x-b)/c)+d
fit [fit_begin:fit_end] f(x) fname via a,b,c,d
plot fname every 1 notitle lt 22 ps 1.5,\
    f(x) notitle lc 2

fname = "nopipe/nopipe_P-vs-T_3.dat"
x_start = 90
set xrange [x_start:x_start+80]
set xtics x_start,20,x_start+80
set mxtics 2
fit_begin=92.5
fit_end=140
a=7
b=fit_begin
c=5
d=1
f(x) = a*exp(-(x-b)/c)+d
fit [fit_begin:fit_end] f(x) fname via a,b,c,d
plot fname every 1 notitle lt 22 ps 1.5,\
    f(x) notitle lc 2

fname = "nopipe/nopipe_P-vs-T_4.dat"
x_start = 120
set xrange [x_start:x_start+80]
set xtics x_start,20,x_start+80
set mxtics 2
fit_begin=128.5
fit_end=180
a=7
b=fit_begin
c=5
d=1
f(x) = a*exp(-(x-b)/c)+d
fit [fit_begin:fit_end] f(x) fname via a,b,c,d
plot fname every 1 notitle lt 22 ps 1.5,\
    f(x) notitle lc 2

set key box
set key height 1
set key width 1
set key spacing 1.5
set key at graph 1.8,screen 0.2 center center
fname = "nopipe/nopipe_P-vs-T_5.dat"
x_start = 110
set xrange [x_start:x_start+80]
set xtics x_start,20,x_start+80
set mxtics 2
fit_begin=121.5
fit_end=180
a=7
b=fit_begin
c=5
d=1
f(x) = a*exp(-(x-b)/c)+d
fit [fit_begin:fit_end] f(x) fname via a,b,c,d
plot fname every 1 title "data points" lt 22 ps 1.5,\
    f(x) title "Fitting Curve" lc 2
unset multiplot
