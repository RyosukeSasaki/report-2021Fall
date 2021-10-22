reset
unset multiplot
set terminal wxt
oname = "../graph/thermion/all.tex"
set output oname
set terminal tikz size 12cm, 20cm
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

set logscale y

#set yrange [0:1400]
#set xtics 0,100,350
#set mxtics 2

plot for [i=1:7] file = sprintf("thermion/If=%sA.txt", num[i]) tit = sprintf("$I_f=%s\\ \\si{\\ampere}$", num[i]) file u (sqrt($1)):2 title tit