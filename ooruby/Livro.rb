class Livro
    #attr_accessor :titulo, :preco, :ano_lancamento
    attr_reader :titulo, :preco, :ano_lancamento

    def initialize(titulo, preco, ano_lancamento)
        @titulo = titulo
        @preco = preco
        @ano_lancamento = ano_lancamento
    end


    def imprime_nota_fiscal
        puts "Titulo: #{self.titulo} - #{self.preco}"
    end



    def calcula_preco(preco)
        if @ano_lancamento < 2000
              preco = preco*0.7
        else
            preco
          end
   end
end

def cria_livro_com_desconto(titulo, preco, ano_lancamento)
    preco *= 0.7 if ano_lancamento < 2000
    return Livro.new(titulo, preco, ano_lancamento)
end
=begin
ruby = Livro.new("Ruby", 19.9, 1995)
java = Livro.new("Java", 137.6, 1998)
nodeJS = Livro.new("NodeJS", 84.2, 2010)
=end

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 2000
       puts "Newsletter"
       puts livro.titulo
       puts livro.preco
    end
end

ruby = cria_livro_com_desconto("Ruby", 19.9, 1995)
java = cria_livro_com_desconto("Java", 137.6, 1998)
nodeJS = cria_livro_com_desconto("NodeJS", 84.2, 2010)
algoritmos = cria_livro_com_desconto("Algoritmos", 58, 2010)
agile = cria_livro_com_desconto("Agile Web Development with Rails", 70.0, 2011)

ruby.imprime_nota_fiscal
java.imprime_nota_fiscal
nodeJS.imprime_nota_fiscal
agile.imprime_nota_fiscal