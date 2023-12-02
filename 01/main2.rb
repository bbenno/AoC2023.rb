#! /usr/bin/env ruby
# frozen_string_literal: true

ints = (1..9).map(&:to_s)
strings = %w[one two three four five six seven eight nine]
mapping = ints.zip(strings).map.with_index { [[_1.first, 1 + _2], [_1.last, 1 + _2]].to_h }.inject(:merge)

values = ARGF.readlines(chomp: true).map do |line|
  # positive lookahead required to capture overlapping matches.
  line.scan(/(?=(#{mapping.keys.join('|')}))/).flatten
      .then { "#{mapping[_1.first]}#{mapping[_1.last]}".to_i }
end

puts values.sum
