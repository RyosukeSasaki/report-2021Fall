reset
unset multiplot
#set terminal wxt
oname = "../graph/thin/all.tex"
set terminal tikz size 12cm, 20cm
set output oname
set size square

set xlabel "Time / sec"
set ylabel "Pressure $10^{-3}$/$\\si{\\pascal}$"
set print "thin/note.txt"
set print

set yrange [0:10]
a=7
c=22
d=0.2
f(x) = a*exp(-(x-b)/c)+d
array x_start[5] = [110, 400, 230, 240, 90]
array num[5] = ["1", "2", "3", "4", "5"]

set multiplot layout 3, 2
unset key
i = 1
while (i < 6) {
    fname = "thin/pipe-thin_P-vs-T_".num[i].".dat"
    poname = "thin/range_".num[i].".txt"
    x_end = x_start[i] + 160
    fit_begin = x_start[i]
    fit_begin_minerr = x_start[i]
    c_minerr_percent = 100
    set xrange [x_start[i]:x_end]
    set xtics x_start[i],40,x_start[i]+160
    set mxtics 4
    b=fit_begin
    set print poname
    set fit quiet
    set fit nolog
    while (fit_begin < x_end-40) {b=fit_begin;
        fit [fit_begin:x_end] f(x) fname via a,b,c,d;
        if (c_minerr_percent > (c_err / c)) {
            c_minerr_percent = (c_err / c)
            fit_begin_minerr = fit_begin
        }
        print sprintf("%f, %f", fit_begin, (c_err / c));
        fit_begin = fit_begin + 1}
    set print
    b = fit_begin_minerr
    fit [fit_begin_minerr:x_end] f(x) fname via a,b,c,d;
    set print "thin/note.txt" append
    print "\r\n", i
    print "fit_begin = ", fit_begin_minerr
    print "fit_end = ", x_end
    print "a = ", a, " +/- ", a_err
    print "b = ", b, " +/- ", b_err
    print "c = ", c, " +/- ", c_err
    print "d = ", d, " +/- ", d_err
    if (i == 5) {
        set key box
        set key height 1
        set key width 1
        set key spacing 1.5
        set key at graph 1.8,screen 0.2 center center
        plot fname every 1 title "data points" lt 22 ps 1,\
            f(x) title "Fitting Curve" lc 2
    }
    if (i < 5) {
        plot fname every 1 notitle lt 22 ps 1,\
            f(x) notitle lc 2
    }
    i = i + 1

}
unset multiplot

#fname = "thin/pipe-thin_P-vs-T_5.dat"
#x_start = 90
#fit_end=x_start+160
#set xrange [x_start:x_start+160]
#plot fname every 1 notitle lt 22 ps 1.5
