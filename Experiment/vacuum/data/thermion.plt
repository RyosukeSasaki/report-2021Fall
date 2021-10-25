reset
unset multiplot
#set terminal wxt
oname = "../graph/thermion/all.tex"
set output oname
set terminal tikz size 10cm, 11cm
set size square

set xlabel "$\\sqrt{V_A}\\ /\\ \\si{\\volt^{1/2}}$"
set ylabel "$I_P\\ /\\ \\si{\\micro\\ampere}$"
set print

array num[7] = ["5.0", "5.2", "5.4", "5.6", "5.8", "6.0", "6.2"]

set key box
set key height 1
set key width 1
set key spacing 1.5
set key right bottom

set xrange [0:20]
set xtics 0,5,20
set mxtics 5
#set yrange [0:10000]

array a[7] = [0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01]
array b[7] = [20, 40, 100, 110, 130, 170, 1000]
array af[7]
array bf[7]
array fit_begin_minerr[7] = [0,0,0,0,0,0,0]
array ap_minerr_percent[7] = [100, 100, 100, 100, 100, 100, 100]
fit_end = 20
f(x) = ap * x + bp
set fit quiet
set fit nolog
set print "thermion/line.dat"

i = 1
while (i < 8) {
    file = sprintf("thermion/If=%sA.txt", num[i])
    ap = a[i]
    bp = b[i]
    fit_begin = 0
    while (fit_begin < 15.5) {
        fit [fit_begin:fit_end] f(x) file u (sqrt($1)):($2) via ap, bp
        if (ap_minerr_percent[i] > (ap_err / ap)) {
            ap_minerr_percent[i] = ap_err / ap
            fit_begin_minerr[i] = fit_begin
            af[i] = ap
            bf[i] = bp
        }
        fit_begin = fit_begin + 0.2
    }
    print sprintf("%f %f", af[i], bf[i]);
    i = i + 1
}
set logscale y
plot for [i=1:7] "thermion/If=".num[i]."A.txt" u (sqrt($1)):2:(sqrt($1)>fit_begin_minerr[i] ? 0xff0000:0xa020f0) title "$I_f=".num[i]."\\ \\si{\\ampere}$" lc rgbcolor variable,\
for [i=1:7] af[i]*x+bf[i] notitle lc 8 dt 2