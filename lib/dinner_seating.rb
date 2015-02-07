require_relative 'seating_arrangement'

class PartyHost
  def initialize(relationship_scores)
    @relationship_scores = relationship_scores
    # We assume for now the matrix passed in is correctly formed
    @number_of_guests = @relationship_scores.length
  end

  def seating_arrangement
    # Added SeatingArrangement in for the time being to make evaluation
    # easier, don't know how long it will last
    SeatingArrangement.new((0...@number_of_guests).to_a)
  end

  def seating_arrangement_score
    # Have to go out now, when I carry on I'll pick one
    # of the options below
    return -1

    # This seems to make more sense than the approach below
    seating_arrangement.inject(0) { |score, guest|
      score +
        guest.feelings_towards(
          seating_arrangement.left_of_guest(guest)
        ) +
        guest.feelings_towards(
          seating_arrangement.right_of_guest(guest)
        )
    }

    # First attempt programming by wishful thinking
    seating_arrangement.inject(0) { |score, guest_number|
      score + @feelings.of(
        guest: guest_number,
        towards: (seating_arrangement.left_of_guest(guest_number))
      ) + @feelings.of(
        guest: guest_number,
        towards: (seating_arrangement.right_of_guest(guest_number))
      )
    }
  end
end