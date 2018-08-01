function plot_lineage(Lineage,No_cluster,cluster_label,Cell_dist,folder)
% Plot clustering labels and pseudotime on lineage inferred by SoptSC.
% Input:
%   -- Lineage: lineage inferred by SoptSC
%   -- No_cluster: Number of clusters
%   -- cluster_label: Cell clustering labels
%   -- Cell_dist: distance between each cell and root cell on cell-cell graph
%   -- folder: folder name where the results will be saved to.


% Use nice colors 
%cmap1 = jet;
%mymap1 = cmap1;
%ncolor = size(mymap1,1);
%mycolor = mymap1(1:round(ncolor./No_cluster):ncolor,:);
mycolor = acolors(No_cluster);


% plot cluster color on lineage tree
pred = Lineage;
rootedTree = digraph(pred(pred~=0),find(pred~=0));

figure;
%plot(rootedTree,'Marker','o','MarkerSize',20,'NodeColor',mycolor(1:No_cluster,:));
h = plot(rootedTree,'Marker','o','MarkerSize',20, ...
    'EdgeColor',[0,0,0], 'LineWidth',1.4, 'ArrowSize',12, ...
    'NodeColor',mycolor(1:No_cluster,:),'NodeLabel',[]);
for i=1:No_cluster
   text(h.XData(i)+0.08,h.YData(i),num2str(i),'fontsize',16);
end

set(gca,'xtick',[]); set(gca,'ytick',[]);
set(gca,'XColor','none'); set(gca,'YColor','none');
set(gca,'FontName','Arial');
set(gca,'FontSize',12);

%title('Cluster on lineage')

fig = gcf;
fig.PaperPositionMode = 'auto';
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];
%fig.PaperUnits = 'inches';
%fig.PaperPosition = [0 0 4 3];

print([folder '\Lineage_Cluster_Color'],'-dpdf','-r300'); 



cmap = parula;
mymap = cmap(1:58,:);

ptimecolor = zeros(No_cluster,1);

for i = 1:No_cluster
     ptimecolor(i) = mean(Cell_dist(cluster_label==i));
%     ptimecolor(i) = mean(Ptime(find(cluster_label==i)));
end

pred = Lineage;
rootedTree = digraph(pred(pred~=0),find(pred~=0));
figure;
colormap(mymap);

%plot(rootedTree,'Marker','o','MarkerSize',20,'NodeCData',ptimecolor, 'NodeColor','flat','NodeLabel',[]);
h = plot(rootedTree,'Marker','o','MarkerSize',20, ...
    'EdgeColor',[0,0,0], 'LineWidth',1.4, 'ArrowSize',12, ...
    'NodeCData',ptimecolor,'NodeColor','flat', 'NodeLabel',[]);
for i=1:No_cluster
   text(h.XData(i)+0.08,h.YData(i),num2str(i),'fontsize',16);
end

cb = colorbar;
ax = gca;
axpos = ax.Position;
cpos = cb.Position;
cpos(3) = 0.5*cpos(3);
cb.Position = cpos;
ax.Position = axpos;
% lim = caxis
% cb.Limits = lim;
aa = cell(1,2);
aa{1} = 'low';
aa{2} = 'high';
cb.TickLabels{1} = aa{1};
cb.TickLabels{end} = aa{2};

for ii = 2:length(cb.TickLabels)-1
    cb.TickLabels{ii} = [];
end
box on;

colorbar('off')

set(gca,'xtick',[]); set(gca,'ytick',[]);
set(gca,'XColor','none'); set(gca,'YColor','none');
set(gca,'FontName','Arial');
set(gca,'FontSize',12);
%title('Pseudotime on lineage')

%set(h,'Units','Inches');
%pos = get(h,'Position');
%set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

fig = gcf;
fig.PaperPositionMode = 'auto';
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];

print([folder '\Lineage_ptime_Color'],'-dpdf','-r300'); 

