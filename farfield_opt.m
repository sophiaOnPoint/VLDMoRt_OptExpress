%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Farfield Analysis
%%% UPDATE: 11-22-2021
%%% AUTHOR: Yuqin Sophia Duan, FDTD generated
%%% NOTES:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
load farfield_opt3.mat; %Load farfield file exported from FDTD
x =lum.x;
y =lum.y;
A =lum.z;
colormap jet ;
imagesc(x, y, real(transpose(A)));
set(get(gca, 'XLabel'), 'String', 'ux')
set(get(gca, 'XLabel'), 'FontSize', 16)
set(get(gca, 'XLabel'), 'FontWeight', 'bold')
set(get(gca, 'YLabel'), 'String', 'uy')
set(get(gca, 'YLabel'), 'FontSize', 16)
set(get(gca, 'YLabel'), 'FontWeight', 'bold')
set(gca, 'XLim', [-1 1])
set(gca, 'YLim', [-1 1])
set(get(gca, 'Title'), 'String', '')
set(get(gca, 'Title'), 'FontSize', 18)
set(get(gca, 'Title'), 'FontWeight', 'bold')
% mycolormap = customcolormap([0 0.5 1], {'#ffffff','#ff0000','#000000'});
% colorbar;
% colormap(mycolormap);
axis off;
set(gca, 'YDir','normal');
hold on
r= sin(36/180*pi)*1; %Mark the boundary of NA=0.6
viscircles([0,0],r,'color','w','LineStyle',':','LineWidth',0.5);

%% Calculate eta2
NA = [];
R = 1; %R is normalized
maxPower=0;
N = 91-1;

for k = 0:N
    theta = k*90/N;
    r= sin(theta/180*pi)*R; %NA = R*sin(theta)
    power = 0;
    
    for i = 1:size(x,2)
        for j = 1:size(y,2)
            maxPower = maxPower + A(i,j);%Sum of all energy emits into the upper plane
            if ((x(i)^2 + y(j)^2) <= (r+0.05)^2) %if it's within the certain NA value
                power = power + A(i,j);
            end
        end
    end
    NA = [NA power];
end

theta = linspace(0,90,N+1);
figure(2);
subplot(2,2,1)
NA = NA/maxPower*(N+1); %E(NA)/E(all), calibrate in ratio
plot(sin(theta/180*pi),NA/2,'-','LineWidth',3);
line([0.6;0.6],[0;NA(38)/2],'linestyle','--');
line([0;0.6],[NA(38)/2;NA(38)/2],'linestyle','--');
yticks([0,NA(38)/2,0.5])
yticklabels({'',num2str(round(NA(38)/2*100)/100),'',''})
%xticklabels({''})
%set(gca, 'YTick', sort([round(NA(40)*100)/100, get(gca, 'YTick')]));
set(gca,'FontSize',15);
ylim([0 0.5]);
xlim([0 1]);
%xlabel('{\theta}','FontSize',15,'fontweight','bold');
%ylabel('{\eta}_{NA}','FontSize',15,'fontweight','bold')
%title('Integrated Energy Ratio')
% simulation = load('integrate_L=1.mat');
% hold on
% plot(sin(simulation.diff_agl/180*pi),simulation.NA,'-','LineWidth',3);
% hold off