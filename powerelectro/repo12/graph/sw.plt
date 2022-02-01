reset
set terminal tikz size 10cm, 7cm
set output "sw.tex"
#set terminal wxt
set size square
set samples 10000

set zeroaxis

set xlabel "$t$ / $\\si{\\micro\\second}$"
set ylabel "$v_{\\rm ce}$ / $V$"
set y2label "$i$ / $I$"

#set format x "$%.1t \times 10^{%T}$"
set xrange [-1:11]
set yrange [-0.1:1.1]
set y2range [-0.1:1.1]

#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

set key right outside
#set key height 1
#set key width -1
#set key spacing 1.5
v(x) = (x<0) ? 1:(x<2) ? 1-0.5*x:(x<4) ? 0:(x<6) ? 0.5*x-2:(x<10) ? 1:6-0.5*x
i(x) = (x<0) ? 0:(x<2) ? 0.5*x:(x<4) ? 1:(x<6) ? 3-0.5*x:(x<10) ? 0:0.5*x-5
plot v(x) axis x1y1 title "$i$",\
i(x) axis x1y2 title "$v_{\\rm ce}$"