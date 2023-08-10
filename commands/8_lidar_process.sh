SCRIPT_DIR=$( cd ${0%/*} && pwd -P )
sh $SCRIPT_DIR/0_generate_train_txt.sh
sh $SCRIPT_DIR/1_generate_depthmap.sh
sh $SCRIPT_DIR/2_generate_initial_lidar.sh
sh $SCRIPT_DIR/3_generate_plane.sh
sh $SCRIPT_DIR/4_generate_final_lidar.sh