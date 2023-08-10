source_folder=$(yq -r '.source_path' commands/runner.yaml)
kitti_path=$(yq -r '.kitti_path' commands/runner.yaml)
sequence=$(yq -r '.sequence' commands/runner.yaml)
split=training
SCRIPT_DIR=$( cd ${0%/*} && pwd -P )
fake_sequence=9999
real_sequence=8888

echo "$source_folder"
echo "$kitti_path"

cmd="ln -sf $kitti_path/tracking/$split/calib/`printf %04d $sequence`.txt $kitti_path/tracking/$split/calib/$fake_sequence.txt"
# echo $cmd
eval $cmd

rm $kitti_path/tracking/$split/image_02/$fake_sequence
cmd="ln -sf $kitti_path/tracking/$split/image_02/`printf %04d $sequence` $kitti_path/tracking/$split/image_02/$fake_sequence"
# echo $cmd
eval $cmd

cmd="ln -sf $kitti_path/tracking/$split/label_02/`printf %04d $sequence`.txt $kitti_path/tracking/$split/label_02/$fake_sequence.txt"
# echo $cmd
eval $cmd

cmd="ln -sf $kitti_path/tracking/$split/oxts/`printf %04d $sequence`.txt $kitti_path/tracking/$split/oxts/$fake_sequence.txt"
# echo $cmd
eval $cmd

rm $kitti_path/tracking/$split/velodyne/$fake_sequence
cmd="ln -sf $kitti_path/$source_folder/$split/pseudo_lidar_train_sparse $kitti_path/tracking/$split/velodyne/$fake_sequence"
# echo $cmd
eval $cmd

echo "------------------------"

cmd="ln -sf $kitti_path/tracking/$split/calib/`printf %04d $sequence`.txt $kitti_path/tracking/$split/calib/$real_sequence.txt"
# echo $cmd
eval $cmd

rm $kitti_path/tracking/$split/image_02/$real_sequence
cmd="ln -sf $kitti_path/tracking/$split/image_02/`printf %04d $sequence` $kitti_path/tracking/$split/image_02/$real_sequence"
# echo $cmd
eval $cmd

cmd="ln -sf $kitti_path/tracking/$split/label_02/`printf %04d $sequence`.txt $kitti_path/tracking/$split/label_02/$real_sequence.txt"
# echo $cmd
eval $cmd

cmd="ln -sf $kitti_path/tracking/$split/oxts/`printf %04d $sequence`.txt $kitti_path/tracking/$split/oxts/$real_sequence.txt"
# echo $cmd
eval $cmd

rm $kitti_path/tracking/$split/velodyne/$real_sequence
cmd="ln -sf $kitti_path/tracking/$split/velodyne/`printf %04d $sequence` $kitti_path/tracking/$split/velodyne/$real_sequence"
# echo $cmd
eval $cmd