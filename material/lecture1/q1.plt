set terminal tikz size 8cm, 8cm
set output "q1.tex"
#set terminal wxt
set size square

set xlabel "$x / a$"
set ylabel "$V(x) / V_0$"
set xrange [-2.2:2.2]
set yrange [-1.1:1.1]

f(x) = cos(2*pi*x)

plot f(x) notitle