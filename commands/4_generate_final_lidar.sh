source_folder=$(yq -r '.source_path' commands/runner.yaml)
python ./src/preprocess/kitti_sparsify.py \
    --pl_path  KITTI/$source_folder/training/pseudo_lidar_train  \
    --sparse_pl_path  KITTI/$source_folder/training/pseudo_lidar_train_sparse/