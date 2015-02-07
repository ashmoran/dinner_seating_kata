require 'spec_helper'
require_relative '../../lib/dinner_seating'

# Attempt 1 – let's see if it's feasible to TDD something efficient from
# scratch without having to look up a known algorithm

describe PartyHost do
  subject(:host) { PartyHost.new(relationships) }

  # Only just added SeatingArrangement so we need to
  # convert it to an array still
  let(:chosen_arrangement) { host.seating_arrangement.to_a }
  let(:chosen_arrangement_score) { host.seating_arrangement_score }

  context "one seat" do
    let(:relationships) {
      [
        [0]
      ]
    }

    it "includes all guests" do
      expect(chosen_arrangement).to be == [0]
    end
  end

  # Both arrangements are equivalent (the guests are sitting opposite
  # each other, but this lets us drive out a basic scoring system)
  context "two seats" do
    context "indifferent guests" do
      let(:relationships) {
        [
          [0, 0],
          [0, 0]
        ]
      }

      it "includes all guests" do
        expect(chosen_arrangement).to match_array([0, 1])
      end

      it "has a score 0" do
        pending "needs a scoring algorithm"
        expect(chosen_arrangement_score).to be == 0
      end
    end

    context "0 likes 1" do
      let(:relationships) {
        [
          [0, 1],
          [0, 0]
        ]
      }

      it "includes all guests" do
        expect(chosen_arrangement).to match_array([0, 1])
      end

      it "has a score 0" do
        pending "needs a scoring algorithm"
        expect(chosen_arrangement_score).to be == 1
      end
    end
  end
end