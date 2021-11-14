reset
set terminal wxt
set terminal tikz size 8cm, 6cm
set output "../graph/g_factor_23M.tex"
set size square

set xlabel "B / mT"
set ylabel "吸収強度 / arbitary unit"

#set format x "$%.1t \times 10^{%T}$"

set xrange [-1.5:1.5]
set yrange [-0.04:0.12]
set xtics -2,1,2
set mxtics 2
set ytics -0.04,0.04,0.12
set mytics 2

unset key
plot "23M.dat" every 1 u (1000*($2)*2000*(1.2566*10**(-6))*(0.8)**(1.5)/0.15):3 notitle
set terminal wxt
replot