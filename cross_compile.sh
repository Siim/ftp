rm -r build
mkdir build
cd build
cmake   -DCROSS_COMPILE_PATH="/opt/arm/arm-ca9-linux-gnueabihf-6.5" \
        -DROOTFS="/na51055_linux_sdk/BSP/linux-kernel/" \
        ..
make
