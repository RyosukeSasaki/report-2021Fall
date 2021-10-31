reset
#set terminal tikz size 10cm, 8cm
#set output ""
set terminal wxt
set size square

set xlabel ""
set ylabel ""

#set format x "$%.1t \times 10^{%T}$"

set xrange [0:350]
set yrange [0:1400]
set samples 10000


#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

#set key left top box
#set key height 1
#set key width -1
#set key spacing 1.5
#set logscale y

array num[7] = ["5.0", "5.2", "5.4", "5.6", "5.8", "6.0", "6.2"]
a=1
n=1.5
f(x) = a*x**n
fit [0:10] f(x) "thermion/If=".num[7]."A.txt" via a

plot for [i=1:7] "thermion/If=".num[i]."A.txt" u 1:2,\
f(x) notitle