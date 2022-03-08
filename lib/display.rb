class Display
    def initialize(board)
        @print_welcome = print(WELCOME)
        @print_board = print_board(board)
        @print_instructions = print(INSTRUCTIONS)
        @print_player_mode_prompt = print(PLAYER_MODE_PROMPT)
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

    def validate_selection(selection)
        if selection == CHOICE_ONE || selection == CHOICE_TWO
            true
        else
            print(INVALID_SELECTION)
            false
        end
    end
    
    def get_player_mode
        player_mode = gets.chomp
        until validate_selection(player_mode)
            player_mode = gets.chomp
        end
        player_mode_single?(player_mode)
    end

    def player_mode_single?(selection)
        selection == CHOICE_ONE ? true : false
    end

    def get_computer_mode
        computer_mode = gets.chomp
        until validate_selection(computer_mode)
            computer_mode = gets.chomp
        end
        computer_mode_easy?(computer_mode)
    end

    def computer_mode_easy?(selection)
        selection == CHOICE_ONE ? true : false
    end

    def get_player_order
        player_order = gets.chomp
        until validate_selection(player_order)
             player_order = gets.chomp
        end
        player_first?(player_order)
    end

    def player_first?(selection)
        selection == CHOICE_ONE ? true : false
    end

    def print_order_selection_prompt
        print(PLAYER_ORDER_PROMPT)
    end

    def print_computer_mode_prompt
        print(COMPUTER_MODE_PROMPT)
    end
end

