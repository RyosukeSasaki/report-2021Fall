reset
unset multiplot
#set terminal wxt
oname = "../../graph/NaCl_all.tex"
fname = "NaCl.txt"
set terminal tikz size 12cm, 20cm
set output oname
set size square

set xlabel "$2\\theta$ / $\\si{\\degree}$"
set ylabel "Intensity / arbitrary unit"

f1(x)=A/(sqrt(2*pi)*sigma)*exp(-(x-x0)**2/(2*sigma**2))
f2(x)=A/(2*sqrt(2*pi)*sigma)*exp(-(x-2*180/pi*asin(1.54433/1.54051*sin(x0/2*pi/180)))**2/(2*sigma**2))   
g(x)=f1(x)+f2(x)+BG+AG*x

array x_start[5]    = [25,      30,     44,     53.5,   55]
array x_end[5]      = [29,      33,     47,     54,     58]
array x_tics[5]     = [1,       1,      1,      0.1,    1]
array y_start[5]    = [63000,   55000,  52000,  43600,  38500]
array y_end[5]      = [70000,   95000,  70000,  45600,  44000]
array y_tics[5]     = [1000,    5000,   4000,   400,    1000]
array fit_start[5]  = [27,      31,     44,     53.6,   55]
array fit_end[5]    = [27.7,    32.5,   47,     53.8,   58]

array x0_arr[5]     = [27.4,    31.7,   45.3,   53.72,  56.27]
array A_arr[5]      = [1000,    30000,  3200,   100,    400]
array BG_arr[5]     = [64000,   64000,  106000, 48000,  43000]
array AG_arr[5]     = [-0.1,    -0.1,   -1100,  -50,    -50]
sigma = 0.1
pi = 3.1415926535


set multiplot layout 3, 2
unset key
i = 1
while (i < 6) {
    x0 = x0_arr[i]
    A = A_arr[i]
    BG = BG_arr[i]
    AG = AG_arr[i]

    fit [fit_start[i]:fit_end[i]] g(x) "NaCl.txt" via x0, sigma, A, BG, AG

    set xrange [x_start[i]:x_end[i]]
    set yrange [y_start[i]:y_end[i]]

    set xtics x_start[i],x_tics[i],x_end[i]
    set mxtics 2
    set ytics y_start[i],y_tics[i],y_end[i]
    set mytics 2

    if (i == 5) {
        set key box
        set key height 1
        set key width 1
        set key spacing 1.5
        set key at graph 1.8,screen 0.2 center center

        plot fname every 1 title "測定値" lt 22 ps 1,\
            g(x) title "Fitting曲線" lc 2
    }
    if (i < 5) {
        plot fname every 1 notitle lt 22 ps 1,\
            g(x) notitle lc 2
    }
    i = i + 1
}
unset multiplot