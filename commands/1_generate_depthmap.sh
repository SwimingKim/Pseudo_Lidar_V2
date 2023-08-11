source_folder=$(yq -r '.source_path' commands/runner.yaml)
python ./src/main.py -c src/configs/sdn_kitti_train.config \
    --pretrain sdn_kitti_object_trainval.pth \
    --datapath  KITTI/$source_folder/training \
    --data_list ./split/train.txt --generate_depth_map --data_tag train