echo '======= 1ST ADQ RUN ======='
sh scripts/adaquant.sh resnet resnet50 4 4 True
echo '======= 2ND ADQ RUN ======='
sh scripts/adaquant.sh resnet resnet50 8 8 True
echo '======= 3RD RUN - INT PROGR ======='
sh scripts/integer-programing.sh resnet resnet50 4 4 8 8 50 loss True

# Uncomment to run first configuration only
#for cfg_idx in 0
for cfg_idx in 0 1 2 3 4 5 6 7 8 9 10 11
do
   # TODO: run bn and bias tuning in loop on all configurations
   echo '======= bn_tuning.sh RUN ======='
   sh scripts/bn_tuning.sh resnet resnet50 8 8 $cfg_idx
   echo '======= bias_tuning.sh RUN ======='
   sh scripts/bias_tuning.sh resnet resnet50 8 8 $cfg_idx
done
