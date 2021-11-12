class Rules
    def won?(board)
        WINNING_COMBOS.each do |combo|
            square_1 = board.squares[combo[0]]
            square_2 = board.squares[combo[1]]
            square_3 = board.squares[combo[2]]

            if square_1 == square_2 && square_2 == square_3
                return square_1
            end
        end
        return false
    end

    def winner(board)
        won?(board)
    end

    def draw?(board)
        !won?(board) && board.board_full?
    end

    def game_over?(board)
        won?(board) || draw?(board)
    end
end
