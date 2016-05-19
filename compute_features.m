function f = compute_features(traj, v1, t1, v2, t2, v3, t3)

gf = GeomFeatures(traj);
 
for j = 1:size(v1,2)
    for i = 1:size(t1, 1)
        f1(i,j) = gf.F_jd_bin(v1(1,j), v1(2,j), v1(3,j), v1(3,j), t1(i,j));
    end
end
    
for j = 1:size(v1,2)
    for i = 1:size(t2,1)
        f2(i,j) = gf.F_pl_bin(v2(1,j), v2(2,j), v2(3,j), v2(4,j), v2(5,j), v2(5,j), t2(i,j));
    end
end
    
for j = 1:size(v1,2)
    for i = 1:size(t3,1)
        f3(i,j) = gf.F_pl_bin(v3(1,j), v3(2,j), v3(3,j), v3(4,j), v3(4,j), v2(5,j), t3(i,j));
    end
end

f = [reshape(f1, [numel(f1), 1]);
    reshape(f2, [numel(f2), 1]);
    reshape(f3, [numel(f3), 1]);];
1;
