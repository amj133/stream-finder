require 'rails_helper'

describe TimeSeries do
  let(:time_series) { {
      "2018-04-11T16:30:00.000-05:00" => 11.2,
      "2018-04-11T16:45:00.000-05:00" => 11.3,
      "2018-04-11T17:00:00.000-05:00" => 11.3,
      "2018-04-11T17:15:00.000-05:00" => 11.2,
      "2018-04-11T17:30:00.000-05:00" => 11.6,
    } }
  subject { TimeSeries.new(time_series) }

  it "sets attributes as reader methods" do
    expect(subject).to be_a(TimeSeries)

    first_datetime = DateTime.strptime("2018-04-11T16:30:00.000-05:00", '%Y-%m-%dT%H:%M')

    expect(subject.time).to be_a(Array)
    expect(subject.time.first).to be_a(DateTime)
    expect(subject.time.first).to eq(first_datetime)

    expect(subject.discharge).to eq([11.2, 11.3, 11.3, 11.2, 11.6])
  end
end
