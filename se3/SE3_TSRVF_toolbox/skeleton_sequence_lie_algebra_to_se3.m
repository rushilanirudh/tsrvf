function out = skeleton_sequence_lie_algebra_to_se3(features)

% features: sequence of skeleton data for different actions

N = length(features); %number of actions in total
[M,T] = size(features{1}); %total number of features and frames
J = 342; %relative pairs of joints M x (M-1)
% for i = 1:J
%     i
%     for j = 1:N
%         x = features{i}(:,j);
%         y = reshape(x,p,6);
%         for k = 1:p
%             B(:,:,k) = lie_algebra_to_SE3(y(k,:));
%         end
%         frames{j} = B;
%         
%     end
%     action{i} = frames;
% end
% out = action;
% end
%         

for n = 1:N
    n
    A = features{n};
    for j = 1:J
        for t = 1:T
            v = A((j-1)*6+1:j*6,t);
            se3_v = lie_algebra_to_SE3(v);
            V(:,:,t) = se3_v;
        end
        JS{j} = V;
    end
    Actions{n} = JS;
end
out = Actions;
    
    

