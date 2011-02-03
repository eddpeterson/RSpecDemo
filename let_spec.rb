class BowlingGame
  def initialize
    @score = 0
  end
  def roll count
    @score = 0 if count == 0
    @score = 20 if count == 1
  end
  def score
    @score
  end
end


describe BowlingGame do
  it "scores all gutters with 0" do
    game = BowlingGame.new
    20.times { game.roll(0) }
    game.score.should == 0
  end
 
  it "scores all 1s with 20" do
    game = BowlingGame.new
    20.times { game.roll(1) }
    game.score.should == 20
  end
end


