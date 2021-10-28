class Computer
    attr_accessor :id, :marker, :type

    def initialize(id, marker, type)
        @id = id
        @marker = marker
        @type = type
    end
end