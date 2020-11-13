require 'player'

describe Player do
  subject(:mel) { Player.new('Mel') }
  subject(:lucy) { Player.new('Lucy') }

  describe '#name' do
    it 'returns the name' do
      expect(mel.name).to eq 'Mel'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(mel.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(lucy).to receive(:receive_damage)
      mel.attack(lucy)
    end
  end

  describe '#receive_damage' do
    it 'reduces the players hit points' do
      expect { mel.receive_damage }.to change { mel.hit_points }.by(-10)
    end
  end

end
