pore_sizes=0:1:1600;
MC_5_percent=normpdf(pore_sizes,371.65,156.77);
MC_7_5_percent=normpdf(pore_sizes,582.21,302.17);
MC_10_percent=normpdf(pore_sizes,608.55,273.90);

figure(51) %figureS1
figname = 'figureS1';
co = orderedcolors("gem");
    color3 = co(3, :);
    color4 = co(4,:);
    color5 = co(5,:);

plot(pore_sizes,MC_5_percent,'Color',color4,'LineWidth',2)
hold on
plot(pore_sizes,MC_7_5_percent,'Color',color3,'LineWidth',2)
plot(pore_sizes,MC_10_percent,'Color',color5,'LineWidth',2)
xlabel('Pore diameter (nm)','FontName','Arial','FontSize',8)
ylabel('Probability density','FontName','Arial','FontSize',8)
legend('5% salt leaching','7.5% salt leaching',...
    '10% salt leaching','FontName','Arial','FontSize',8)
axis([0,1600,0,3e-3])

widthInches = 3;
heightInches = 3;

run('ScriptForExportingImages.m')