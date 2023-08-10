cmd=$(ls /Users/suyoung/Documents/share_ubuntu/KITTI/xycar/training/image_2 | sed -e 's/\..*$//' > split/train.txt)
echo $cmd
