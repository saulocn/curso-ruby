=begin
puts 175 == 175
puts 175 == 174
puts "175" == 174
puts "175".to_i == 175
puts "174".to_i > 175
puts "174".to_i < 175
puts "174".to_i != 175
puts "174".to_i <= 175
puts "174".to_i <= 175
puts "175".to_i != 175
puts "175".to_i != 174

for dedos in 1..3
    puts "contando..." + dedos.to_s
end


chutes = [182, 173,193, 83, 90]
chutes[3] = 200
puts chutes[0]
puts chutes[1]
puts chutes[2]
puts chutes[3]
puts chutes[4]

chutes = []

chute = 176
tentativa = 1
#chutes[tentativa-1] = chute
chutes << chute

chute = 200
tentativa = 2
#chutes[tentativa-1] = chute
chutes << chute

chute = 130
tentativa = 3
#chutes[tentativa-1] = chute
chutes << chute

#puts chutes[0]
#puts chutes[1]
#puts chutes[2]


#for contador in 1..tentativa
#    puts "Chute "+chutes[contador-1].to_s
#end
puts chutes.size
for chute in chutes
    puts chute
end
#puts chutes

nome = gets.strip
puts "#{nome} tem #{nome.size} caracteres"
#puts nome+" tem " +nome.size.to_s + " caracteres"
puts "Resultado"
puts nome[5]

for i in 1..10
    puts i
end
puts i

=end

bemvindo = -> (nome) {
  puts "Bem vindo " + nome + "!"
}
bemvindo.("Saulo") # Bem vindo Guilherme!
bemvindo.call("Saulo") # Bem vindo Guilherme!