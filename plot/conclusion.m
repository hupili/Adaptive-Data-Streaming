%conclusion

close all ;
clear ;

%keep 5 instances for every experiment series
%if I ran more than 5 instances, just keep the 
%first 5 runs. no matter what to keep, it is random. 
%the first 5 is just for no artifical construction .
%that results in the similar situation where
%I didn't run more than 5 instances. 

%exp6, baseline
data1 = [
300	160	5417	0.461595460073746	1.85794277190933
300	160	5357	0.673103778733422	1.98687986685028
300	160	4996	0.651053702922358	1.94782857877817
300	160	5537	0.841837176431355	1.96243243682475
300	160	5508	0.804646669049598	1.97510988481839
] ;

%exp7, simple pals 
data2 = [
300	160	13687	3.37429088590486	3.93236021539588
300	160	13927	3.25426757315208	3.97947868651312
300	160	13116	3.29975255821203	3.96248788005398
300	160	11133	3.2748654025896	3.98045105920939
300	160	11735	3.34072354331766	3.95892683563407
] ;

%exp8, priority based, arch upgrade
data3 = [
300	160	10862	3.1566498709763	4.0209876224751
300	160	14438	3.27241248553895	3.96386252366657
300	160	13958	3.19675287584068	3.96367320612426
300	160	13835	3.23773136564891	3.99606826513611
300	160	13657	3.33887101142655	3.96161392533989
] ;

%exp10, scalable window
data4 = [
300	160	16632	3.35795862331715	4.00242327032676
300	160	17142	3.32799439725326	3.96064970644841
300	160	15789	3.35919940178308	4.01236897016012
300	160	15428	3.35800445515098	3.95654094718144
300	160	17112	3.40374401152701	4.04781892352465
] ;

%exp11, performance optimization
data5 = [
300	160	13054	3.4268944406572	4.01065364594964
300	160	12964	3.40867013710605	3.97871513437683
300	160	8270	3.41751051988296	4.00205908350331
300	160	12875	3.41525009800868	3.99045578482244
300	160	9685	3.29832658707108	4.02171880965122
] ;

%exp12, 2nd section random
data6 = [
300	160	11881	3.39762439216782	3.97552556113407
300	160	9926	3.35247223996873	4.00146314153856
300	160	13685	3.38047913739533	3.98143913868984
300	160	12513	3.29956477303871	4.01132330731943
300	160	13204	3.40838940071383	4.00532643765895
] ;

name = {
'base',
'pals',
'p_pals',
's_window',
'perf_opt',
'2nd_rnd'
} ;
time = [data1(:, 3), data2(:, 3), data3(:, 3), data4(:, 3), data5(:, 3), data6(:, 3)] ;
% qoe = [data1(:, 5), data2(:, 5), data3(:, 5), data4(:, 5), data5(:, 5), data6(:, 5)] ;
qoe = [data1(:, 4), data2(:, 4), data3(:, 4), data4(:, 4), data5(:, 4), data6(:, 4)] ;
figure
boxplot(time, name) ;
ylabel('Simulation Time') ;
title('simu\_time vs version') ;
print(gcf, '-deps', 'con_time_version_all.eps') ; 
figure ;
boxplot(qoe, name) ;
ylabel('QoE(nonneg)') ;
title('qoe vs version') ;
print(gcf, '-deps', 'con_qoe_version_all.eps') ; 

name = {
'pals',
'p_pals',
's_window',
'perf_opt',
'2nd_rnd'
} ;
time = [data2(:, 3), data3(:, 3), data4(:, 3), data5(:, 3), data6(:, 3)] ;
% qoe = [data2(:, 5), data3(:, 5), data4(:, 5), data5(:, 5), data6(:, 5)] ;
qoe = [data2(:, 4), data3(:, 4), data4(:, 4), data5(:, 4), data6(:, 4)] ;
figure ;
boxplot(time, name) ;
ylabel('Simulation Time') ;
title('simu\_time vs version') ;
print(gcf, '-deps', 'con_time_version_part.eps') ; 
figure ;
boxplot(qoe, name) ;
ylabel('QoE(nonneg)') ;
title('qoe vs version') ;
print(gcf, '-deps', 'con_qoe_version_part.eps') ; 


