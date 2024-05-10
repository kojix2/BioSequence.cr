require "./spec_helper"

module T
  extend Bio::Sequence
end

describe Bio::Sequence do
  it "reverse_complement" do
    seq = T.normalize_sequence("ATGC")
    T.reverse_complement(seq).should eq(T.normalize_sequence("GCAT"))
  end
end
