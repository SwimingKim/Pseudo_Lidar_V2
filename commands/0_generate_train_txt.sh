source=KITTI/new_object/training
rm -rf results/sdn_kitti_train_set/depth_maps
rm -rf $source/depth_map
rm -rf $source/pseudo_lidar_train
rm -rf $source/pseudo_lidar_train_planes
rm -rf $source/pseudo_lidar_train_sparse

ls $source

cmd=$(ls $source/image_2 | sed -e 's/\..*$//' > split/train.txt)
echo $cmd
echo $(cat split/train.txt | wc -l)
