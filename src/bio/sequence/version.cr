module Bio
  module Sequence
    VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
  end
end
