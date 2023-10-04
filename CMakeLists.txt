cmake_minimum_required(VERSION 3.5)
project(ftp)

if(DEFINED CROSS_COMPILE_PATH)
    # the name of the target operating system
    message(STATUS "SETTING CROSS COMPILER")
    set(CMAKE_SYSTEM_NAME Linux)

    #SET(CROSS_COMPILE_PATH "/opt/arm/arm-ca9-linux-gnueabihf-6.5")
    if(NOT ${ROOTFS})
        set(ROOTFS "${CROSS_COMPILE_PATH}")
    endif()
    #SET(ROOTFS "/na51055_linux_sdk/BSP/linux-kernel/")

    add_compile_options(-nostdinc)

    # which compilers to use for C and C++
    set(CMAKE_C_COMPILER   ${CROSS_COMPILE_PATH}/bin/arm-ca9-linux-gnueabihf-gcc)
    set(CMAKE_CXX_COMPILER ${CROSS_COMPILE_PATH}/bin/arm-ca9-linux-gnueabihf-g++)

    set(CMAKE_FIND_ROOT_PATH  ${ROOTFS})
    link_directories(${CROSS_COMPILE_PATH}/lib ${CROSS_COMPILE_PATH}/local/lib ${CROSS_COMPILE_PATH}/arch/powerpc/boot)
    
    
    

    # adjust the default behavior of the FIND_XXX() commands:
    # search programs in the host environment
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    
    # search headers and libraries in the target environment
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    
endif()

add_executable(${PROJECT_NAME} server.h server.c handles.c)


if(DEFINED CROSS_COMPILE_PATH)

    # target_include_directories(${PROJECT_NAME} SYSTEM PRIVATE
    #     /opt/arm/arm-ca9-linux-gnueabihf-6.5/arm-ca9-linux-gnueabihf/sysroot/usr/include/
    # )
    target_include_directories(${PROJECT_NAME} BEFORE PRIVATE 
        ${CROSS_COMPILE_PATH}/arm-ca9-linux-gnueabihf/sysroot/usr/include/
        ${ROOTFS}/arch/powerpc/boot/
        ${ROOTFS}/arch/arm/include/generated/
        ${CROSS_COMPILE_PATH}/arm-ca9-linux-gnueabihf/include/c++/6.5.0/
        ${CROSS_COMPILE_PATH}/lib/gcc/arm-ca9-linux-gnueabihf/6.5.0/include/
    )
endif()
