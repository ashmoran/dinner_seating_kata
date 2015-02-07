class SeatingArrangement
  include Enumerable

  def initialize(guest_numbers)
    @guest_numbers = guest_numbers
  end

  def left_of_guest(guest_number)
    guest_number_index = @guest_numbers.index(guest_number)
    @guest_numbers[guest_number_index - 1]
  end

  def right_of_guest(guest_number)
    guest_number_index = @guest_numbers.index(guest_number)
    @guest_numbers[(guest_number_index + 1) % @guest_numbers.length]
  end

  def each(&block)
    # Should Enumberable be implemented to not leak internal state?
    # Never considered that before, I'll look into it if I come back to this
    @guest_numbers.each(&block)
  end

  def to_a
    @guest_numbers.dup
  end
end
