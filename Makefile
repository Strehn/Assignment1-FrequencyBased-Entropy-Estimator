CC = gcc
CFLAGS = -Wall -Wextra -std=c99
TARGET = password_strength
SRC = password_strength.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

test: $(TARGET)
	./test.sh

clean:
	rm -f $(TARGET)
