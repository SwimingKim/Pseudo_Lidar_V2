SCRIPT_DIR=$( cd ${0%/*} && pwd -P )
sh $SCRIPT_DIR/7_tracking_to_object.sh
sh $SCRIPT_DIR/8_lidar_process.sh
sh $SCRIPT_DIR/9_fake_object_to_tracking.sh