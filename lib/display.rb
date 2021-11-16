class Display
    def initialize(board)
        @print_welcome = print(WELCOME)
        @print_board = print_board(board)
        @print_instructions = print(INSTRUCTIONS)
        @print_player_choice = print(PLAYER_TYPE_CHOICE)
    end

    def print(message)
        puts message
    end

    def print_board(board)
        print("\n
                         #{board.squares[0]} | #{board.squares[1]} | #{board.squares[2]}
                        -----------
                         #{board.squares[3]} | #{board.squares[4]} | #{board.squares[5]}
                        -----------
                         #{board.squares[6]} | #{board.squares[7]} | #{board.squares[8]}
        \n")
    end

    def print_turn_prompt(marker)
        print("Player #{marker}, you're up!\n")
    end

    def print_winner(marker)
        print("Player #{marker} has won this round!\n\n")
    end

    def validate_player_type(player_type)
        if player_type == HUMAN_PLAYER || player_type == COMPUTER_PLAYER
            true
        else
            print(INVALID_SELECTION)
            false
        end
    end

    def get_player_type
        player_type = gets.chomp
        until validate_player_type(player_type)
            player_type = gets.chomp
        end
        player_type
    end

    def get_computer_type
        computer_type = gets.chomp
        until validate_computer_type(computer_type)
            computer_type = gets.chomp
        end
        computer_type_easy?(computer_type)
    end

    def computer_type_easy?(computer_selection)
        computer_selection == EASY_COMPUTER ? true : false
    end

    def validate_computer_type(computer_type)
        if computer_type == EASY_COMPUTER || computer_type == AI_COMPUTER
            true
        else
            print(INVALID_COMPUTER_SELECTION)
            false
        end
    end

    def get_order_selection
        order_selection = gets.chomp
        until validate_order_selection(order_selection)
             order_selection = gets.chomp
        end
        order_selection
    end

    def validate_order_selection(order_selection)
        if order_selection == PLAYER_ONE || order_selection == PLAYER_TWO
            true
        else
            print(INVALID_ORDER_SELECTION)
            false
        end
    end

    def print_order_selection_prompt
        print(PLAYER_ORDER_CHOICE)
    end

    def print_computer_type_prompt
        print(COMPUTER_TYPE_CHOICE)
    end
end

