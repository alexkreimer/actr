load traj

num_features = 1000;

close all;

[~, num_joints, num_frames] = size(traj);

gf = GeomFeatures(traj);

for i = 1:num_features
    j = randsample(num_joints, 2);
    t = randsample(num_frames, 1);

    f1(i) = gf.F_jd(j(1), j(2), t, t);
end
subplot(131);
hist(f1);
 
f2 = [];
for i = 1:num_features
    j = randsample(num_joints, 4);
    t = randsample(num_frames, 1);
    
    f2(i) = gf.F_pl_bin(j(1), j(2), j(3), j(4), t, t);
end
subplot(132);
hist(f2);

f3 = [];
for i = 1:num_features
    j = randsample(num_joints, 4);
    t = randsample(num_frames, 1);

    f3(i) = gf.F_np_bin(j(1), j(2), j(3), j(4), t, t);
end
subplot(133);
hist(f3);

