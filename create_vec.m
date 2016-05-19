function [vec1, vec2, vec3] = create_vec(size)
vec1 = [];

chain_size = 19;
for i = 1:size
    j = randsample(chain_size, 2);
    t = randsample(chain_size, 1);

    vec1(:,i) = [j', t]';
end

vec2 = [];
for i = 1:size
    j = randsample(chain_size, 4);
    t = randsample(chain_size, 1);
    
    vec2(:,i) = [j', t]';
end

vec3 = [];
for i = 1:size
    j = randsample(chain_size, 4);
    t = randsample(chain_size, 1);

    vec3(:,i) = [j', t]';
end