cmake_minimum_required(VERSION 3.5)
project(ftp)
add_executable(${PROJECT_NAME} server.h server.c handles.c)