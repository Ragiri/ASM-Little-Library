##
## EPITECH PROJECT, 2019
## PSU_2019_malloc
## File description:
## Makefile
##

NAME = libasm.so

OBJ = 	$(SRC:.o)

FLAGS = -Wall -Werror -fpic

SRC = 	src/strlen.asm \
		src/strchr.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/strstr.asm \
		src/rindex.asm \
		src/strpbrk.asm \
		src/strcspn.asm \
		src/strcasecmp.asm \
		src/memset.asm	\
		src/memcpy.asm \
		src/memmove.asm \

CFLAGS += -I include/

all: $(NAME)

$(NAME):
		$(foreach s, $(SRC), nasm -f elf64 $(s);)
		ld --shared -o $(NAME) src/*.o

clean:
		rm -f src/*.o

fclean: clean
		rm -f $(NAME)   \
		rm -f *~        \
		rm -f *#        \

re:     fclean all

.PHONY: all re clean fclean
