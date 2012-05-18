%
clear ;
clc ;
close all ;

fid = fopen('sample.time_qoe', 'r') ;
q = fscanf(fid, '%f', [2, inf]) ;

q(1, :) = int32(q(1, :)/10) ;
c = 0:48 ;
a = 0:48 ;
for i = 1:length(q)
    a(q(1,i) + 1) = a(q(1,i) + 1) + q(2,i) ;
    c(q(1,i) + 1) = c(q(1,i) + 1) + 1 ;
end

for i = 1:length(a)
    a(i) = a(i) / c(i) ;
end

x = 0:10:480 ;

plot(x, a) ;
xlabel('Time Section') ;
ylabel('QoE(MOS)') ;
title('QoE v.s. Time Section(N=160,T=480)') ;

% figure ;
% plot(log(x), a) ;

hold on ;
% p = polyfit(x(2:end), a(2:end), 2) ;
% yy = polyval(p, x) ;
% plot(x, yy, 'r') ;

p = polyfit(log(x(2:end)), a(2:end), 1) ;
yy = polyval(p, log(x)) ;
plot(x, yy, 'r') ;

% set(gcf, 'Position', [100, 100, 400, 300]) ;
% set(gcf, 'PaperUnits', 'pixels') ;
% set(gcf, 'PaperSize', [400, 300]) ;
print(gcf, '-deps', 'time_qoe.eps') ; 