require "./spec_helper"

describe Bio::Sequence do
  # TODO: Write tests

  it "has a version number" do
    Bio::Sequence::VERSION.should be_a(String)
  end
end
