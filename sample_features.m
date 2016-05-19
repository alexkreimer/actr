function [v1,t1, v2, t2, v3, t3] = sample_features(Xs, vsize, do_plots)

% The features factory: sample the joints and the thresholds:
%
% The joints are sample randomly
%
% The thresholds are taken as the bin centers of the histograms 
% created from the sample data across different trajectories

% Xs is a sample data
% vsize is the number of features of each type to generate (i.e., you will
% get 4*vsize total features)
% do_plots plot on/off

if nargin<3
    do_plots = 0;
end

[v1, v2, v3] = create_vec(vsize);

f1 = nan(size(Xs,2), vsize)';
f2 = nan(size(Xs,2), vsize)';
f3 = nan(size(Xs,2), vsize)';
for i=1:size(Xs,2)
    traj = reshape(Xs(:,i),3,[],60);
    gf = GeomFeatures(traj);
    
    for j = 1:vsize
        f1(i,j) = gf.F_jd(v1(1,j), v1(2,j), v1(3,j), v1(3,j));
    end
    
    for j = 1:vsize
        f2(i,j) = gf.F_pl(v2(1,j), v2(2,j), v2(3,j), v2(4,j), v2(5,j), v2(5,j));
    end
    
    for j = 1:vsize
        f3(i,j) = gf.F_pl(v3(1,j), v3(2,j), v3(3,j), v3(4,j), v3(4,j), v2(5,j));
    end
end

if do_plots
    figure;
end

for i=1:vsize
    if do_plots
        subplot(1,vsize,i);
        title(sprintf('joints %d, %d, pose %d', v1(1,i), v1(2,i), v1(3,i)));
        hold on;
        histogram(f1(:,i),3);
    end
    [~, centers] = histcounts(f1(:,i),3);
    t1(:,i) = centers;
end

if do_plots
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 1,'\bf Distance between joints','HorizontalAlignment','center','VerticalAlignment', 'top')
    figure;
    
end


for i=1:vsize
    if do_plots
        subplot(1,vsize,i);
        title(sprintf('joints %d,%d,%d,%d pose %d', v2(1:4,i), v2(5,i)));
        hold on;
        histogram(f2(:,i),3);
    end
    [~, centers] = histcounts(f2(:,i),3);
    t2(:,i) = centers;
end
if do_plots
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 1,'\bf Dist to the plane, type1','HorizontalAlignment' ,'center','VerticalAlignment', 'top');
    figure;
    
end

for i=1:vsize
    if do_plots
        subplot(1,vsize,i);
        title(sprintf('j%d,%d,%d,%d pose %d', v3(1:4,i), v3(3,i)));
        hold on;
        histogram(f3(:,i),3);
    end
    [~, centers] = histcounts(f3(:,i),3);
    t3(:,i) = centers;
end

if do_plots
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 1,'\bf Distance to the plane, type 2','HorizontalAlignment','center','VerticalAlignment', 'top')
end

1;