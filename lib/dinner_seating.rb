class PartyHost
  def initialize(relationship_scores)
    @relationship_scores = relationship_scores
  end

  def seating_arrangement
    (0...@relationship_scores.length).to_a
  end

  def seating_arrangement_score
    0
  end
end