require 'spec_helper'
require_relative '../../lib/dinner_seating'

# Attempt 1 – let's see if it's feasible to TDD something efficient from
# scratch without having to look up a known algorithm

describe PartyHost do
  context "one seat" do
    let(:host) {
      PartyHost.new(
        [
          [0]
        ]
      )
    }

    let(:chosen_arrangement) { host.seating_arrangement }

    it "includes all guests" do
      pending "stub"
      expect(chosen_arrangement).to be == [0]
    end
  end
end