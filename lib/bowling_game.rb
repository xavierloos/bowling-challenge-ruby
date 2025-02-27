class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    result = 0
    rollIndex = 0
    10.times do
      if strike?(rollIndex)
        result += strikeScore(rollIndex)
        rollIndex += 1
      elsif spare?(rollIndex)
        result += spareScore(rollIndex)
        rollIndex += 2
      else
        result += frameScore(rollIndex)
        rollIndex += 2
      end
    end
    result
  end

  private

  # A strike (x) is when you knock down all the pins with the ball on your first try.
  def strike?(rollIndex)
    @rolls[rollIndex] == 10
  end

  def strikeScore(rollIndex)
    10 + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
  end

  # A spare (/) is when you knock down all the pins on your second try.
  def spare?(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
  end

  def spareScore(rollIndex)
    10 + @rolls[rollIndex + 2]
  end

  def frameScore(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1]
  end
end
