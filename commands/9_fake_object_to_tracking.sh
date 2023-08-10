source_folder=$(yq -r '.source_path' commands/runner.yaml)
kitti_path=$(yq -r '.kitti_path' commands/runner.yaml)
sequence=$(yq -r '.sequence' commands/runner.yaml)
split=training
SCRIPT_DIR=$( cd ${0%/*} && pwd -P )
new_sequence=9999

echo "$source_folder"
echo "$kitti_path"

cmd="ln -sf $kitti_path/tracking/$split/calib/`printf %04d $sequence`.txt $kitti_path/tracking/$split/calib/$new_sequence.txt"
echo $cmd
eval $cmd

cmd="ln -sf $kitti_path/tracking/$split/image_02/`printf %04d $sequence` $kitti_path/tracking/$split"
mv $kitti_path/tracking/$split/`printf %04d $sequence` $kitti_path/tracking/$split/image_02/`printf %04d $sequence`

cmd="ln -sf $kitti_path/tracking/$split/label_02/`printf %04d $sequence`.txt $kitti_path/tracking/$split/label_02/$new_sequence.txt"
echo $cmd
eval $cmd

cmd="ln -sf $kitti_path/tracking/$split/oxts/`printf %04d $sequence`.txt $kitti_path/tracking/$split/oxts/$new_sequence.txt"
echo $cmd
eval $cmd

cmd="ln -sf $SCRIPT_DIR/../KITTI/$source_folder/$split/pseudo_lidar_train_sparse $kitti_path/tracking/$split/velodyne/$new_sequence"
echo $cmd
eval $cmd
