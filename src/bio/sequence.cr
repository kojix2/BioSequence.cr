require "./sequence/version"

module Big
  module Sequence
    def reverse_complement(sequence : Slice(UInt8)) : Slice(UInt8)
      complements = {
        65u8 => 84u8, # A -> T
        67u8 => 71u8, # C -> G
        71u8 => 67u8, # G -> C
        84u8 => 65u8, # T -> A
        78u8 => 78u8, # N -> N
      }

      r = Slice(UInt8).new(sequence.size)
      sequence.size.times do |i|
        b = sequence.unsafe_fetch(i)
        r[i] = complements.fetch(b) { raise "Invalid nucleotide: #{b}" }
      end

      return r
    end
  end
end
