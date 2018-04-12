require 'rails_helper'

describe TimeSeries do
  let(:time) { [1, 2, 3, 4, 5] }
  let(:discharge) { [11.2, 11.3, 11.3, 11.2, 11.6] }
  subject { TimeSeries.new(time, discharge) }

  it "sets attributes as reader methods" do
    expect(subject).to be_a(TimeSeries)
    expect(subject.time).to eq(time)
    expect(subject.discharge).to eq(discharge)
  end
end
