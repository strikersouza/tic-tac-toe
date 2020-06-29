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

    def self.victory?
        if vertical_checker || horizontal_checker || diagonal_checker
            return true
        end
    end

    def self.vertical_checker
        case
        when (@@position[0]) && (@@position[3]) && (@@position[6]) == "X" || (@@position[0]) && (@@position[3]) && (@@position[6]) == "O"
            return true
        when (@@position[1]) && (@@position[4]) && (@@position[7]) == "X" || (@@position[1]) && (@@position[4]) && (@@position[7]) == "O"
            return true
        when (@@position[2]) && (@@position[5]) && (@@position[8]) == "X" || (@@position[2]) && (@@position[5]) && (@@position[8]) == "O"
            return true
        end
    end

    def self.horizontal_checker
        case
        when (@@position[0]) && (@@position[1]) && (@@position[2]) == "X" || (@@position[0]) && (@@position[1]) && (@@position[2]) == "O"
            return true
        when (@@position[3]) && (@@position[4]) && (@@position[5]) == "X" || (@@position[3]) && (@@position[4]) && (@@position[5]) == "O"
            return true
        when (@@position[6]) && (@@position[7]) && (@@position[8]) == "X" || (@@position[6]) && (@@position[7]) && (@@position[8]) == "O"
            return true
        end
    end

    def self.diagonal_checker
        case
        when (@@position[0]) && (@@position[4]) && (@@position[8]) == "X" || (@@position[0]) && (@@position[4]) && (@@position[8]) == "O"
            return true
        when (@@position[2]) && (@@position[4]) && (@@position[6]) == "X" || (@@position[2]) && (@@position[4]) && (@@position[6]) == "O"
            return true
        end
    end
end

def game(player_one, player_two)
    puts "Bem vindo ao jogo-da-velha!"
    Board.show_table
    for i in 1..9 do
        puts ""
        puts "Jogador1 - Escolha uma posição do tabuleiro: "
        pos = gets.chomp.to_i
        Board.put_table(pos, player_one.to_s)
        puts "Feito!"
        puts "Jogador2 - Escolha uma posição do tabuleiro: "
        pos = gets.chomp.to_i
        Board.put_table(pos, player_two.to_s)
        puts "Aqui está o tabuleiro: "
        Board.show_table
        #victory check
        if Board.victory?
            puts "Temos um vencedor! Parabéns!"
            break
        end
    end
end

player1 = Player.new("X")
player2 = Player.new("O")

game(player1, player2)


=begin
Think about how you would set up the different elements within the game… What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.

player deve ser uma classe
    o que deverá ter dentro dessa classe?
        - X ou O
uma classe para mostrar o tabuleiro
    deverá ter 3 metodos para verificar a vitoria
um loop para rodar o jogo
    ele devera perguntar ao p1 onde ele quer a peça dele
    depois perguntar ao segundo jogador
    mostrar o tabuleiro
    checar a vitoria
        se houver um vencedor
            parar o jogo
                mostrar uma mensagem de vitoria
                    encerrar o programa

COMENTARIO DO ALMOÇO: PRECISO FAZER O METODO VICTORY? LER AS CLASSES PRIVADAS SEM DAR ERRO
=end