python ./src/main.py -c src/configs/sdn_kitti_train.config \
    --pretrain sdn_kitti_object_trainval.pth \
    --datapath  KITTI/new_object/training \
    --data_list ./split/train.txt --generate_depth_map --data_tag train \
    --btrain 4 --bval 1