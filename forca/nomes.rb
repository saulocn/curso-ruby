def le_nome
    nome = gets
    puts "Lido #{nome}"
    nome
end

def pede_nome
    puts "Digite seu nome"
    nome_lido = le_nome
    puts "Pedido"
    nome_lido
end

def inicio
    nome = pede_nome
    puts "Bem vindo #{nome}"

    puts "Quero conhecer mais alguém"
    nome2 = pede_nome
    puts "Olá #{nome2}"
end

inicio
