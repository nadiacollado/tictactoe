require 'computer'

describe Computer do
    let (:marker) { Markers.new("X", "O") }
    let (:easy_strategy) { EasyStrategy.new }
    let (:advanced_strategy) { AdvancedStrategy.new }
    let (:computer_player) { Computer.new(1, marker.p1, easy_strategy) }
    let (:ai_player) { Computer.new(1, marker.p1, advanced_strategy) }

    describe "initialize" do
        it "creates a computer player with given arguments" do
            expect(computer_player.id).to eq(1)
            expect(computer_player.strategy).to be_an_instance_of(EasyStrategy)
            expect(ai_player.strategy).to be_an_instance_of(AdvancedStrategy)
        end
    end
end