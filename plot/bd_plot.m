%b-d plot
close all ;
clear ;

c1 = -5 ;
c2 = 2 ;
alpha = 4 ;
lambda = 0.0015 ;

[dis, br] = meshgrid(linspace(0,0.7,100), linspace(0,1024, 100)) ;
mos = c1 .* dis + alpha .* (1 - exp(-br .* lambda)) + c2 ;

figure
mesh(dis, br, mos) ;
xlabel('disconituity') ;
ylabel('bitrate') ;
zlabel('MOS') ;
print(gcf, '-djpeg', 'bd_3d.jpg') ; 

figure ;
contour(mos) ;
xlabel('disconituity') ;
ylabel('bitrate') ;
print(gcf, '-djpeg', 'bd_contour.jpg') ; 