require 'bike'

describe Bike do
  it { is_expected.to respond_to :condition }

  it 'can be reported as broken' do
    subject.report_broken
    expect(subject.condition).to eq 'broken'
  end
end
