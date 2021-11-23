%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Electric field Analysis
%%% UPDATE: 11-22-2021
%%% AUTHOR: Yuqin Sophia Duan, FDTD generated
%%% NOTES:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
load Ecenter_N_1.mat;
x =lum.x;
y =lum.y;
A =lum.z;


imagesc(x, y, real(transpose(A/max(max(A)))));
set(get(gca, 'XLabel'), 'String', 'x(m)')
set(get(gca, 'XLabel'), 'FontSize', 16)
set(get(gca, 'XLabel'), 'FontWeight', 'bold')
set(get(gca, 'YLabel'), 'String', 'y(m)')
set(get(gca, 'YLabel'), 'FontSize', 16)
set(get(gca, 'YLabel'), 'FontWeight', 'bold')
set(gca, 'XLim', [-8.8e-07 8.8e-07])
set(gca, 'YLim', [-8.8e-07 8.8e-07])
set(get(gca, 'Title'), 'String', '')
set(get(gca, 'Title'), 'FontSize', 18)
set(get(gca, 'Title'), 'FontWeight', 'bold')
mycolormap = customcolormap([0 0.5 1], {'#ffffff','#ff0000','#000000'});
c = colorbar;
c.FontSize = 15;
colormap(mycolormap);
set(gca, 'YDir','normal');
set(c,'Ticks',[0,0.5,1])
set(c,'TickLabels',[0,0.5,1])
xticks([]);
yticks([]);
