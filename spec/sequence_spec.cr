require "./spec_helper"

module T
  extend Bio::Sequence
end

describe Bio::Sequence do
  it "reverse_complement" do
    seq = T.normalize_sequence("ATGC")
    T.reverse_complement(seq).should eq(T.normalize_sequence("GCAT"))
  end

  it "normalize_sequence" do
    seq = T.normalize_sequence("ATGC")
    String.new(seq).should eq("ATGC")
    seq = T.normalize_sequence("atgc")
    String.new(seq).should eq("ATGC")
  end
end
