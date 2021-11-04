class Marker
    attr_accessor :p1_marker, :p2_marker

    def initialize(p1_marker = "X", p2_marker = "O")
        @p1_marker = p1_marker
        @p2_marker = p2_marker
    end
end

