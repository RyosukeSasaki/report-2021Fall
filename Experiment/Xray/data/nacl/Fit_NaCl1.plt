reset
#set terminal tikz size 8cm, 8cm
#set output "../../graph/NaCl1.tex"
set terminal wxt
set size square
set xtics 25,1,29
set mxtics 1
#set ytics 0,0,0
#set mytics 2

set key left bottom box
set key height 1
set key width 1
set key spacing 1.5

set xlabel "$2\\theta$ / $\\si{\\degree}$"
set ylabel "Intensity / arbitrary unit"

set xrange [25:29]
pi = 3.1415926535

x0 = 27.4
BG = 64000
AG = -0.1
A = 1000
sigma = 0.1
f1(x)=A/(sqrt(2*pi)*sigma)*exp(-(x-x0)**2/(2*sigma**2))
f2(x)=A/(2*sqrt(2*pi)*sigma)*exp(-(x-2*180/pi*asin(1.54433/1.54051*sin(x0/2*pi/180)))**2/(2*sigma**2))   
g(x)=f1(x)+f2(x)+BG+AG*x
fit [27:27.7] g(x) "NaCl.txt" via x0, sigma, A, BG, AG

plot "NaCl.txt" u 1:2 title "測定値",\
g(x) title "Fitting曲線"