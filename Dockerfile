FROM ubuntu:22.04 AS builder

RUN apt-get update && \
    apt-get install -y cmake g++ git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Сначала копируем только основные файлы (без tests)
COPY CMakeLists.txt ./
COPY src/ ./src/
COPY include/ ./include/

# Временно копируем tests для возможности ручного управления
COPY tests/ ./tests/

# Удаляем или переименовываем tests директорию перед сборкой
RUN rm -rf tests/ || echo "Tests directory already removed"

# Создаем и очищаем build директорию
RUN rm -rf build && \
    mkdir build && \
    cmake -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --target rpn_calculator --parallel 2

FROM ubuntu:22.04

WORKDIR /app

# Копируем только готовый бинарник
COPY --from=builder /app/build/rpn_calculator .

CMD ["./rpn_calculator"]