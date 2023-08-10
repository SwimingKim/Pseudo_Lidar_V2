source=/Users/suyoung/Documents/share_ubuntu/KITTI/xycar/training
rm -rf $source/depth_map
rm -rf $source/pseudo_lidar_train
rm -rf $source/pseudo_lidar_train_planes
rm -rf $source/pseudo_lidar_train_sparse

ls $source

cmd=$(ls $source/image_2 | sed -e 's/\..*$//' > split/train.txt)
echo $cmd
echo $(cat split/train.txt | wc -l)
