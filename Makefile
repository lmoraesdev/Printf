NAME		= libftprintf.a

LIBFT_DIR	= ./libft
LIBFT		= $(LIBFT_DIR)/libft.a

INCS_DIR	= ./include

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
INCS		= -I$(INCS_DIR) -I$(LIBFT_DIR)
LFLAGS		= -L$(LIBFT_DIR) -lft
LIB			= ar -rcs
LIB1		= ranlib
RM			= /bin/rm -f

SRC_DIR		= ./srcs
SRCS		= $(SRC_DIR)/ft_conversion.c \
			$(SRC_DIR)/ft_convert_c.c \
			$(SRC_DIR)/ft_convert_d_i.c \
			$(SRC_DIR)/ft_convert_p.c \
			$(SRC_DIR)/ft_convert_pct.c \
			$(SRC_DIR)/ft_convert_s.c \
			$(SRC_DIR)/ft_convert_ux.c \
			$(SRC_DIR)/ft_initialize.c \
			$(SRC_DIR)/ft_parse.c \
			$(SRC_DIR)/ft_placeholder.c \
			$(SRC_DIR)/ft_printf.c

OBJS		= $(SRCS:.c=.o)

all:		$(NAME)

$(NAME):	$(OBJS) $(LIBFT)
			$(LIB)	$(NAME) $(OBJS)
			$(LIB1) $(NAME)

.c.o:
			$(CC) $(CFLAGS) $(INCS) -c $< -o $(<:.c=.o)

$(LIBFT):
			make -C $(LIBFT_DIR)
			cp $(LIBFT) $(NAME)

bonus:		all

clean:
			make clean -C $(LIBFT_DIR)
			$(RM) $(OBJS)

fclean:		clean
			make fclean -C $(LIBFT_DIR)
			$(RM) $(NAME)

re:			fclean all

rebonus:	fclean bonus

.PHONY:		all clean fclean re
