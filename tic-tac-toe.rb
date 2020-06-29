module Helper

end

class Player
    attr_reader :type

    def initialize(type)
        @type = type
    end

    def to_s
        "#{type}"
    end
end


class Board
    @@position = Array.new(8)


    def self.show_table
        puts <<-HEREDOC

             #{@@position[0]} | #{@@position[1]} | #{@@position[2]} 
            ---+---+---
             #{@@position[3]} | #{@@position[4]} | #{@@position[5]}
            ---+---+---
             #{@@position[6]} | #{@@position[7]} | #{@@position[8]}

        HEREDOC
    end

    def self.put_table(pos,player)
        @@position[pos] = player
    end
end

player1 = Player.new("X")
player2 = Player.new("O")

puts player1
puts player2

Board.put_table(0,"X")
Board.show_table
Board.put_table(0,"X")
Board.show_table


=begin
Think about how you would set up the different elements within the game… What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.

player deve ser uma classe
    o que deverá ter dentro dessa classe?
        - X ou O
deverá ter um modulo para verificar a vitoria
uma classe para mostrar o tabuleiro
um loop para rodar o jogo
=end