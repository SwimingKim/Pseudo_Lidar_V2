source_folder=$(yq -r '.source_path' commands/runner.yaml)
python ./src/preprocess/generate_lidar_from_depth.py \
    --calib_dir  KITTI/$source_folder/training/calib \
    --depth_dir results/sdn_kitti_train_set/depth_maps/train/  \
    --save_dir  KITTI/$source_folder/training/pseudo_lidar_train/