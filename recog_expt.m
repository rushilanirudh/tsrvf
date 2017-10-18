 function out = recog_expt(distMAT,actions,trials)
% actions = 8;
% trials = 2;
winsize=1;
confusion_mat = zeros(actions);

for test_run = 0:trials-1
     A = 1:actions*trials;
     B = find(mod(A,trials)==test_run);
    testing = B;
    A(B) = [];
    training = A;
   
    for i = 1:length(testing)
        for j = 1:length(training)
         dists(j) = distMAT(B(i),A(j));
        end
        [mindist idx] = min(dists);
        assigned_class = ceil(A(idx)/trials);
        true_class = ceil(B(i)/trials);
        confusion_mat(true_class,assigned_class) = confusion_mat(true_class,assigned_class)+1;
        clear dists;
    end   
end
%out = confusion_mat;
out = 100*sum(diag(confusion_mat))/(actions*trials);
 end