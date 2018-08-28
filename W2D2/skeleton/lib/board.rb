require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    14.times do |idx|
      if idx != 6 && idx != 13
        @cups[idx] = [:stone, :stone, :stone, :stone]
      else
        @cups[idx] = []
      end
    end
    @cups
  end

  def valid_move?(start_pos)

    if start_pos == 6 || start_pos >= 13 || start_pos < 0
      raise 'Invalid starting cup'
    end

    raise 'Starting cup is empty' if @cups[start_pos] == []
  end

  def make_move(start_pos, current_player_name)
    idx = start_pos + 1
    until @cups[start_pos] == []
      @cups[idx % 13] << @cups[start_pos].pop
      idx += 1
    end
    next_turn(idx % 13)

    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
