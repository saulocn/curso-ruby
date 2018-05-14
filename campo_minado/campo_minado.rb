require_relative 'ponto'

class Minesweeper
    attr_reader :largura, :altura, :numero_minas, :campo

    def initialize(largura, altura, numero_minas)
        @largura = largura-1
        @altura = altura-1
        @numero_minas = numero_minas
        @campo = cria_campo
    end

    def cria_campo
        @campo = [altura]
        for linha in 0..altura
            @campo[linha] = []
           for coluna in 0..largura
            @campo[linha][coluna] = Ponto.new(linha, coluna)
           end 
        end
        coloca_bombas
        @campo
    end

    def coloca_bombas
        if @numero_minas>0
            for bomba in 0..@numero_minas
                linha_sorteada = rand(altura-1)
                coluna_sorteada = rand(largura-1)
                ponto_sorteado = @campo[linha_sorteada][coluna_sorteada]
                if !ponto_sorteado.tem_bomba?
                    ponto_sorteado.coloca "*"
                end    
            end
        end
    end

    def play(linha, coluna)
        ponto_a_descobrir = @campo[linha-1][coluna-1]
        if !ponto_a_descobrir.foi_descoberto? && !ponto_a_descobrir.tem_flag?
            if !ponto_a_descobrir.tem_bomba?
                numero_bombas_ao_redor = bombas_ao_redor ponto_a_descobrir
                sem_bombas = numero_bombas_ao_redor == 0
                if sem_bombas 
                    ponto_a_descobrir.set_clear
                else
                    ponto_a_descobrir.coloca numero_bombas_ao_redor.to_s
                end
            end
            ponto_a_descobrir.descobrir
        end
    end

    def flag(linha, coluna)
        ponto_adiciona_flag = @campo[linha-1][coluna-1]
        ponto_adiciona_flag.set_flag
    end

    def victory?
        @campo.each_with_index do |linha_atual, linha|
            linha_atual.each_with_index do |ponto, coluna|
                return false if ponto.tem_bomba? && !ponto.tem_flag?
                return false if !ponto.tem_bomba? && !ponto.foi_descoberto?
                #return false if !ponto.tem_bomba? && !ponto.tem_flag?
            end
        end
        puts
        puts "             OOOOOOOOOOO               "
        puts "         OOOOOOOOOOOOOOOOOOO           "
        puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
        puts "    OOOOOO      OOOOO      OOOOOO      "
        puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
        puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
        puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
        puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
        puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
        puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
        puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
        puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
        puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
        puts "         OOOOOO         OOOOOO         "
        puts "             OOOOOOOOOOOO              "
        puts
        puts "Parabéns! Você ganhou o jogo do campo-minado!"
        true # se o jogador ganhou, e achou todas as células sem bomba
    end

    def defeat?
        @campo.each_with_index do |linha_atual, linha|
            linha_atual.each_with_index do |ponto, coluna|
                if ponto.tem_bomba? && ponto.foi_descoberto?
                    puts "Você perdeu! As minas eram:"
                    board_state true
                    return true 
                end
            end
        end
        false
    end
    def still_playing? 
        return false if victory? || defeat?
        true # se continua jogando, false se o jogador ganhou ou perdeu
    end

    def bombas_ao_redor ponto
        #linha e coluna
        pontos_ao_redor =
        [
            [ponto.x+1, ponto.y],   # linha abaixo, mesma coluna
            [ponto.x-1, ponto.y],   # linha acima, mesma coluna
            [ponto.x, ponto.y+1],   # mesma linha, lado direito
            [ponto.x, ponto.y-1],   # mesma linha, lado esquerdo
            [ponto.x+1, ponto.y+1], # linha abaixo, coluna direita
            [ponto.x-1, ponto.y-1], # linha acima, coluna esquerda
            [ponto.x-1, ponto.y+1], # linha acima, coluna direita
            [ponto.x+1, ponto.y-1], # linha abaixo, coluna esquerda
        ]

        quantidade_de_bombas = 0
        pontos_ao_redor.each do |ponto_adjacente|
            linha = ponto_adjacente[0]
            coluna = ponto_adjacente[1]
            if ponto_eh_valido? linha, coluna
                if @campo[linha][coluna].tem_bomba?
                    quantidade_de_bombas += 1 
                end
            end
        end
        quantidade_de_bombas
    end

    def ponto_eh_valido? linha, coluna
        linha_valida = linha<=@altura && linha>=0
        coluna_valida = coluna<=@largura && coluna>=0
        ponto_valido = linha_valida && coluna_valida
        ponto_valido
    end

    def board_state xray
        # retorna o tabuleiro indicando células não descobertas 
        # retorna qtas bombas tem adjacentes, ou seja 
        #   ###   ###
        #   #0#   #1#
        #   ###   ##*
        # Se xray = true, mostrar as bombas se jogo acabou
        #    board_format = {
        #      unknown_cell: '.',
        #      clear_cell: ' ',
        #      bomb: '#',
        #      flag: 'F'
        #    }
        #puts @campo
        @campo.each_with_index do |linha_atual, linha|
            linha = ""
            linha_atual.each_with_index do |coluna_atual, coluna|
                linha << coluna_atual.show(xray)
            end
            puts "#{linha}\n"
        end
    end

    def da_boas_vindas
        puts
        puts "        P  /_\  P                              "
        puts "       /_\_|_|_/_\                             "
        puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
        puts "   |_|_|nnnn nnnn|_|_|    Jogo de Campo Minado!"
        puts "  |' '  |  |_|  |'  ' |                        "
        puts "  |_____| ' _ ' |_____|                        " 
        puts "        \__|_|__/                              "
        puts
        puts "Qual é o seu nome?"
        nome = gets.strip
        puts "\n\n\n\n\n\n"
        puts "Começaremos o jogo para você, #{nome}"
        nome
    end

end
