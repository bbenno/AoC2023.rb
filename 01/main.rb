#! /usr/bin/env ruby
# frozen_string_literal: true

values = ARGF.readlines(chomp: true).map do |line|
  line.scan(/\d/).flatten.map(&:to_i).then { "#{_1.first}#{_1.last}".to_i }
end

puts values.sum
