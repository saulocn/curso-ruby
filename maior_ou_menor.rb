def da_boas_vindas
    puts("bem vindo ao jogo da adivinhacao")
    puts "Qual é o seu nome?"
    nome = gets.strip 
    #puts "\n\n\n\n\n\nCOmeçaremos o jogo pra vc, " + nome
    puts "\n\n\n\n\n\nComeçaremos o jogo pra vc, #{nome}"
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade? (1 fácil, 5 difícil)"
    dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end
    #maximo =  30, 60, 100, 150, 200
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    #puts "Escollhendo um número secreto entre 0 e 200"
    #sorteado = 175
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar nosso numero secreto\n\n\n\n\n"
    #return sorteado
    sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    #puts "Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    #puts "Chutes até agora: " + chutes.to_s
    puts "Chutes até agora: #{chutes}" 
    puts "Entre com um numero"
    chute = gets.strip
    puts "Você chutou #{chute}"
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = chute.to_i == numero_secreto
    if acertou
        puts "Acertou!"
        return true
    end
    maior = numero_secreto > chute
    if maior
        puts "O número secreto é maior!"
    else
        puts "O número secreto é menor!"
    end
    false
end

def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade
    pontos_ate_agora = 1000
    chutes = []
    limite_de_tentativas = 5
    for tentativa in 1..limite_de_tentativas
        chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
        #chutes[chutes.size] = chute
        chutes << chute
        #total_de_chutes += 1
        if nome == "Saulo"
            puts "Acertou!"
            break
        end
        puts "Será q acertou? vc chutou " + chute.to_s
        #puts chute.to_i == numero_secreto
        #Verificando se acertou
        diferenca = numero_secreto-chute
        
        pontos_a_perder = (chute-numero_secreto).abs/2.0
        #unless pontos_a_perder>0
        #    pontos_a_perder *=-1
        #end
        pontos_ate_agora -= pontos_a_perder
        break if verifica_se_acertou numero_secreto, chute
        #if verifica_se_acertou numero_secreto, chute
        #    break
        #end
        
    end

    puts "Você ganhou #{pontos_ate_agora} pontos!"
end

def nao_quero_jogar?
    puts "Deseja Jogar novamente? S/N"
    nao_quero_jogar = gets.strip
    nao_quero_jogar.upcase == "N"
end

=begin
Mais de uma linha de comentário
=end
#total_de_chutes = 0
nome = da_boas_vindas
dificuldade = pede_dificuldade
#while nao_quero_jogar
loop do
    joga nome, dificuldade
    if nao_quero_jogar?
        break
    end
end
#end
