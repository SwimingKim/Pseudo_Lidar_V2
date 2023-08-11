source_folder=$(yq -r '.source_path' commands/runner.yaml)
source=KITTI/$source_folder/training
echo "source is $source"
rm -rf $source/pseudo_lidar_train
rm -rf $source/pseudo_lidar_train_planes
rm -rf $source/pseudo_lidar_train_sparse
rm -rf $source/depth_map

ls $source

max_count=$(yq -r '.max_count' commands/runner.yaml)
if [ $max_count -eq -1 ]
then
    cmd=$(ls $source/image_2 | sed -e 's/\..*$//' > split/train.txt)
    echo $cmd
else
    cmd=$(ls -U $source/image_2 | head -$max_count | sed -e 's/\..*$//' > split/train.txt)
    echo $cmd
fi

echo $(cat split/train.txt | wc -l)
