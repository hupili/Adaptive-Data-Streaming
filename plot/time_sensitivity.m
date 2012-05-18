%time sensitivity

clear ;
close all ;

fid = fopen('bm.time_node_qoe_qn_c_cn', 'r') ;
data = fscanf(fid, '%f', [6, inf]) ;

q = [data(1,:)] ;
p = [data(3,:)] ;
r = [data(4,:)] ;
total = length(q) ;
a = [30, 60, 120, 240, 480, 960] ;
c = [] ;
e = [] ;
for i = 1:6
    idx = (q(1,:) == a(i)) ;
%     idx = repmat(idx, 2, 1) ;
    d = p(idx)' ;
    b = r(idx)' ;
    c = [c, b] ;
    e = [e, d] ;
end
boxplot(c,a) ;
xlabel('Simulation Time') ;
ylabel('Average QoE') ;
title('QoE(Non Negative) v.s. Simulation Time') ;
print(gcf, '-deps', 'simutime_qoe_nonneg.eps') ; 
figure ;
boxplot(e,a) ;
xlabel('Simulation Time') ;
ylabel('Average QoE') ;
title('QoE v.s. Simulation Time') ;
print(gcf, '-deps', 'simutime_qoe.eps') ; 

