reset
set terminal tikz size 10cm, 10cm
set output "fig2.tex"
#set terminal wxt
set size square

set xlabel "$T\\ /\\ \\si{\\kelvin}$"
set ylabel "$n_e\\ /\\ \\si{\\metre^{-3}}$"

set format x "$10^{%T}$"
set format y "$10^{%T}$"
set samples 10000
set logscale xy

h = (me*c/hbar)**3*g/(6*pi**2)
g = 2
pi = 3.1415926535
hbar = 1.054571817*10**(-34)
me = 9.10938356*10**(-31)
c = 2.99792458*10**(8)
k = 1.38064852*10**(-23)
f(x) = ((2*me*k)**(3/2))/(hbar**3)*(g/(6*pi**2))*x**(3/2)
g(x) = (x**3)*((k/c/hbar)**3)*(g/(6*pi**2))
h(x) = h

T_lim = me*c**2/k
set arrow from T_lim, 1 to T_lim, h nohead lt 1
set yrange [1:10**(68)]
set xrange [1:T_lim*10**(10)]

set style fill transparent solid 0.3 noborder

set label 10 center at screen 0.5, 0.8 "相対論,縮退" font ",8" front
set label 11 center at screen 0.7, 0.3 "相対論,非縮退" font ",8" front
#set label 12 center at screen 0.4, 0.85 "非相対論,縮退" font ",8" front
set label 13 center at screen 0.4, 0.3 "非相対論,非縮退" font ",8" front

#set arrow from T_lim, 1 to T_lim, 10**(68) nohead lt 1

plot \
x>T_lim ? g(x) : 1/0 lt 3 notitle,\
x<T_lim ? h(x) : 1/0 lt 4 notitle,\
[1:T_lim] h(x) with filledc above y=1 fc "orange" notitle,\
[T_lim:] g(x) with filledc above y=1 fc "green" notitle,\
x<T_lim ? h(x) : g(x) with filledc below y=10**(68) fc "cyan" notitle,\

