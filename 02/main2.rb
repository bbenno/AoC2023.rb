#! /usr/bin/env ruby
# frozen_string_literal: true

ids = ARGF.readlines(chomp: true).map do |line|
  line.match(/^Game (?<id>\d+): (?<sets>.*)$/).then do |m|
    %i[blue green red].map do |color|
      m[:sets].scan(/(\d+) #{color}/).flatten.map(&:to_i).max
    end.inject(:*)
  end
end.compact

puts ids.sum
