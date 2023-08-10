source_folder=$(yq -r '.source_path' commands/runner.yaml)
python ./src/preprocess/kitti_process_RANSAC.py \
    --calib_dir  KITTI/$source_folder/training/calib \
    --lidar_dir KITTI/$source_folder/training/pseudo_lidar_train/  \
    --planes_dir  KITTI/$source_folder/training/pseudo_lidar_train_planes/