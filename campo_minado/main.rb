require_relative 'campo_minado'


width, height, num_mines = 10, 20, 50
game = Minesweeper.new(width, height, num_mines)

game.da_boas_vindas
while game.still_playing?
    puts "Veja o mapa de nosso jogo:"
    game.board_state false
    puts "Digite A para abrir uma célula ou F para adicionar uma flag:"
    opcao = gets.strip
    puts "Digite a linha que deseja utilizar (mínimo 1 e máximo #{height}):"
    linha = gets.strip.to_i
    puts "Digite a coluna que deseja utilizar (mínimo 1 e máximo #{width}):"
    coluna = gets.strip.to_i
    linha_invalida = linha < 1 || linha > height
    coluna_invalida = coluna < 1 || coluna > width
    if linha_invalida || coluna_invalida
        puts "Linha e/ou coluna inválida!"
        next
    end
    if opcao == "A"
        game.play(linha, coluna)
    elsif opcao == "F"
        game.flag(linha, coluna)
    end
end