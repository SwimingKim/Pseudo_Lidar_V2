source_folder=$(yq -r '.source_path' commands/runner.yaml)
kitti_path=$(yq -r '.kitti_path' commands/runner.yaml)
tracking_path=$kitti_path/tracking
split=training
sequence=$(yq -r '.sequence' commands/runner.yaml)
echo "sequence is $sequence"

output_symbolic_link_path=KITTI/$source_folder
rm -rf $output_symbolic_link_path/$split

# generate folder
mkdir -p $output_symbolic_link_path/$split

echo "------------------------"

cmd="ln -s $tracking_path/$split/image_02/`printf %04d $sequence`/ $output_symbolic_link_path/$split"
echo $cmd
eval $cmd
mv $output_symbolic_link_path/$split/`printf %04d $sequence`  $output_symbolic_link_path/$split/image_2

cmd="ln -s $tracking_path/$split/image_03/`printf %04d $sequence` $output_symbolic_link_path/$split"
echo $cmd
eval $cmd
mv $output_symbolic_link_path/$split/`printf %04d $sequence`  $output_symbolic_link_path/$split/image_3

cmd="ln -s $tracking_path/$split/velodyne/`printf %04d $sequence` $output_symbolic_link_path/$split"
echo $cmd
eval $cmd
mv $output_symbolic_link_path/$split/`printf %04d $sequence`  $output_symbolic_link_path/$split/velodyne

echo "$tracking_path/$split/calib/`printf %04d $sequence`.txt"
cp $tracking_path/$split/calib/`printf %04d $sequence`.txt $output_symbolic_link_path/$split/calib.txt

echo "$output_symbolic_link_path/$split/calib.txt"

sed -i -e  's/R_rect/R0_rect:/' $output_symbolic_link_path/$split/calib.txt
sed -i -e 's/Tr_velo_cam/Tr_velo_to_cam:/' $output_symbolic_link_path/$split/calib.txt
sed -i -e  's/Tr_imu_velo/Tr_imu_to_velo:/' $output_symbolic_link_path/$split/calib.txt

mkdir $output_symbolic_link_path/$split/calib
count=$(ls $tracking_path/$split/image_02/`printf %04d $sequence` | wc -l)
for i in `seq 0 $count`;
do
	cmd="cp $output_symbolic_link_path/$split/calib.txt $output_symbolic_link_path/$split/calib/`printf %06d $i`.txt"
	# echo $cmd
	eval $cmd
done