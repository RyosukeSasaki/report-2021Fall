reset
unset multiplot
set terminal wxt
#oname = "../graph/them/all.tex"
#set output oname
#set terminal tikz size 12cm, 20cm
set size square
set fit quiet
set fit nolog

set xlabel "$V_A\\ /\\ \\si{\\volt}$"
set ylabel "$I_P\\ /\\ \\si{\\micro\\ampere}$"

array num[7] = ["5.0", "5.2", "5.4", "5.6", "5.8", "6.0", "6.2"]
array x_begin[10] = [90, 110, 130, 150, 175, 200, 225, 250, 300, 350]

set key box
set key height 1
set key width 1
set key spacing 1.5
set key left top

set yrange [0:1400]
set xtics 0,100,350
set mxtics 2

file = sprintf("thermion/If=%sA.txt", num[7])
a = 1200
b = 10**(-3)
f(x) = a*exp(b*sqrt(x))

x_begin_minerr = 0
b_minerr_percent = 100
i = 1
set print "thermion/note.txt"
while (i <= 8) {
    fit [x_begin[i]:400] f(x) file via a,b
    if (b_minerr_percent > (b_err / b)) {
        b_minerr_percent = (b_err / b)
        x_begin_minerr = x_begin[i]
    }
    set print "thermion/note.txt" append
    print "\r\n", i
    print "fit_begin = ", x_begin[i]
    print "fit_end = ", 400
    print "a = ", a, " +/- ", (a_err / a), "%"
    print "b = ", b, " +/- ", (b_err / b), "%"
    i = i + 1
}
set fit noquiet
set print
print x_begin_minerr
fit [x_begin_minerr:400] f(x) file via a,b
plot file, f(x)