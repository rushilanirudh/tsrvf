
### Contents of this toolbox:

`main.m` - main file that loads data, warps it and gives you a warped set of
se(3) x se(3) x..x se(3) trajectories.

`se3_raw_trajectory_dist.m` - function that takes two actions 
(of form 1 x 182 cell) and computes a distance without any warping. 

`se3_warp_trajectory_dist.m` -  function that takes two actions 
(of form 1 x 182 cell) and computes a distance after warping using the 
TSRVF.

`se3_warp_dist.m` - function that takes two trajectories on se(3) of the form
4 x 4 x T,and computes the warped distance using TSRVF.  

`se3_raw_dist.m` - function that takes two trajectories on se(3) of the form 
4 x 4 x T, and computes the unwarped, raw distance between them. 


DATA - In `'/Florence3D'`
--------------------------------------------------------------------------
`reg_seq_lie.mat` - contains all the actions in vector space
if you don't want to simply play with the data without tsrvf stuff. 215 action, each of the form - 1092xT for T frames. 

`se3_actions_dataset.mat` - the raw actions in the manifold feature on se(3) x se(3) x se(3).. x se(3). These are unwarped sequences. 

`warped_actions.mat` - these are actions in the manifold feature form, after warping with 30 iterations. You can use these with any of the functions described above, if you don't want to waste time re-warping. 

