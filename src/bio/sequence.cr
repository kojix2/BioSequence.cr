require "./sequence/version"

module Bio
  module Sequence
    def reverse_complement(sequence : Slice(UInt8)) : Slice(UInt8)
      complements = {
        65u8 => 84u8, # A -> T
        67u8 => 71u8, # C -> G
        71u8 => 67u8, # G -> C
        84u8 => 65u8, # T -> A
        78u8 => 78u8, # N -> N
      }

      size = sequence.size
      Slice(UInt8).new(size) do |i|
        b = sequence.unsafe_fetch(size - i - 1)
        complements.fetch(b) { raise "Invalid nucleotide: #{b}" }
      end
    end

    def normalize_base(c : UInt8) : UInt8
      case c
      when 65u8, 97u8  then 65u8 # A
      when 67u8, 99u8  then 67u8 # C
      when 71u8, 103u8 then 71u8 # G
      when 84u8, 116u8 then 84u8 # T
      when 78u8, 110u8 then 78u8 # N
      else
        STDERR.puts "'#{c.chr}' is replaced with 'N'"
        78u8 # N
      end
    end

    # Experimental

    def normalize_sequence(sequence : IO::Memory | String) : Slice(UInt8)
      sequence.to_slice.map do |c|
        normalize_base(c)
      end
    end

    # Experimental

    def normalize_sequence(sequence : IO::Memory | String) : Slice
      sequence.to_slice.map do |c|
        yield normalize_base(c)
      end
    end
  end
end
