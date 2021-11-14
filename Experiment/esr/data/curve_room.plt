reset
set terminal wxt
set terminal tikz size 10cm, 8cm
set output "../graph/curve_room.tex"
set size square

set xlabel "B / mT"
set ylabel "吸収強度 / arbitary unit"

#set format x "$%.1t \times 10^{%T}$"

set key right top box
set key height 1
set key width 2
set key spacing 1.5

#set xrange [-1.5:1.5]
#set yrange [-0.04:0.12]
#set xtics -2,1,2
#set mxtics 2
#set ytics -0.04,0.04,0.12
#set mytics 2
a=0.1032
b=-0.0056
d=0.16297
x0=-0.83401
l(x)=a*(d/2)**2/((x-x0)**2+(d/2)**2)+b
g(x)=a*exp(-(4*log(2))*(x-x0)**2/d**2)+b

plot "room.dat" every 1 u (1000*($2)*2000*(1.2566*10**(-6))*(0.8)**(1.5)/0.15):3 title "測定値", l(x) title "Lorentz型", g(x) title "Gauss型"
set terminal wxt
replot