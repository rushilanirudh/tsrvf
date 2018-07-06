function out = generate_per_skeleton_features(JSeq)
Joints = length(JSeq);
%K = size(JSeq{1},2);
K = length(JSeq{1});
for k = 1:K
    k
   vec = [];
   for n = 1:Joints
       %tmp = JSeq{n}(:,k);
       tmp = JSeq{n}{k};
       vec = [vec;tmp(:)];
   end
   V(:,k) = vec;
end
out = V;