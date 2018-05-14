class Ponto
    attr_accessor :x, :y, :conteudo, :descoberto, :flag
    attr_reader :bomba, :bandeira, :clear, :unknown

    def initialize(x, y)
        @x = x
        @y = y
        @descoberto = false
        @flag = false
        @bomba = "*"
        @clear = " "
        @unknown = "."
        @bandeira = "F"
        @conteudo = @unknown
        
    end

    def coloca conteudo
        @conteudo = conteudo
    end

    def tem_bomba?
        return true if conteudo==@bomba
        false
    end

    def set_clear
        coloca @clear
    end

    def set_flag
        if @flag
            return @flag = false
        end
        @flag = true
    end

    def show xray
        #    board_format = {
        #      unknown_cell: '.',
        #      clear_cell: ' ',
        #      bomb: '#',
        #      flag: 'F'
        #    }
        #puts descoberto
        return conteudo if descoberto || xray
        return @bandeira if @flag
        @unknown
    end

    def foi_descoberto?
        return descoberto
    end

    def tem_flag?
        @flag
    end

    def descobrir
        @descoberto = true
    end


end