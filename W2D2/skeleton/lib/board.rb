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
    idx = start_pos
    # byebug
    until @cups[start_pos] == []
      idx += 1
      @cups[idx % 14] << @cups[start_pos].pop
    end

    render


    end_idx = next_turn(idx % 14)

    if end_idx == :switch
      return :switch
    elsif end_idx == :prompt
      return :prompt
    else
      end_idx
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt,
    # or ending_cup_idx
    # byebug
    # if @cups[ending_cup_idx].length == 1
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    else
      return :switch
    end
    # return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].any? && @cups[0..5].all? { |x| x == [] }
      return true
    elsif @cups[7..12].any? && @cups[7..12].all? { |x| x == [] }
      return true
    end
    false
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    end
    if @cups[6].length > @cups[13].length
      return "Erica"
    else
      return "James"
    end 
  end
end
