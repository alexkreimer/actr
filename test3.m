clear all;
close all;

load Action3DSkelData;

% This generates N features and 4 thresholds for each type 
% of feature (N*4 different features for each type of geometric feature).
% Now there are 3 different types of features, thus you get a N*4*3-vector.
N = 10;
[v1, t1, v2, t2, v3, t3] = sample_features(Xs, N);

for i = 1:size(Xs,2)
    % this is an example of how to compute the binary feature vector given the
    % features and the thresholds
    traj = reshape(Xs(:,i),3,[],60);
    f(:,i) = compute_features(traj, v1, t1, v2, t2, v3, t3);
end

% f has a dimension of the number of features \times the number of samples
spy(f)

1;


