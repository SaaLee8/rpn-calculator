# Создаем отдельный исполняемый файл для тестов
add_executable(rpn_tests test_rpn.cpp)

# Подключаем заголовочные файлы
target_include_directories(rpn_tests PRIVATE ${CMAKE_SOURCE_DIR}/include)

# Связываем с основными исходными файлами
target_sources(rpn_tests PRIVATE ${CMAKE_SOURCE_DIR}/src/rpn.cpp)

# Настраиваем Google Test
include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.1
)
FetchContent_MakeAvailable(googletest)

# Линкуем с gtest
target_link_libraries(rpn_tests PRIVATE gtest gtest_main)

# Добавляем тест
add_test(NAME rpn_tests COMMAND rpn_tests)