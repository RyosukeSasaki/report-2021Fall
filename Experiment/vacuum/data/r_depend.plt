set terminal wxt
set size square

set xlabel ""
set ylabel ""

#set format x "$%.1t \times 10^{%T}$"

set xrange [0:20]
set yrange [0:2]

#set xtics 0,0,0
#set mxtics 2
#set ytics 0,0,0
#set mytics 2

#set key left top box
#set key height 1
#set key width -1
#set key spacing 1.5
a=0.001
b=0.0001
f(x) = a*x**3
g(x) = b*x**4

fit f(x) "r_depend.dat" via a
fit g(x) "r_depend.dat" via b

plot "r_depend.dat", f(x), g(x)