cmake_minimum_required(VERSION 3.20)
project(RPN_Calculator VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Добавляем основное приложение
add_executable(rpn_calculator src/main.cpp src/rpn.cpp)
target_include_directories(rpn_calculator PRIVATE include)

# Включаем тестирование
enable_testing()

# Добавляем поддиректорию с тестами
#add_subdirectory(tests)