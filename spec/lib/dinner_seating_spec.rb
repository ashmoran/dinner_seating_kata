require 'spec_helper'
require_relative '../../lib/dinner_seating'

# Attempt 1 – let's see if it's feasible to TDD something efficient from
# scratch without having to look up a known algorithm

describe PartyHost do
  subject(:host) { PartyHost.new(relationships) }

  let(:chosen_arrangement) { host.seating_arrangement }
  let(:chosen_arrangement_score) { host.seating_arrangement_score }

  context "one seat" do
    let(:relationships) {
      [
        [0]
      ]
    }

    let(:chosen_arrangement) { host.seating_arrangement }

    it "includes all guests" do
      expect(chosen_arrangement).to be == [0]
    end
  end

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
        expect(chosen_arrangement_score).to be == 0
      end
    end
  end
end