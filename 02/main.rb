#! /usr/bin/env ruby
# frozen_string_literal: true

bag = { red: 12, green: 13, blue: 14 }

ids = ARGF.readlines(chomp: true).map do |line|
  line.match(/^Game (?<id>\d+): (?<sets>.*)$/).then do |m|
    next unless %i[blue green red].all? do |color|
      m[:sets].scan(/(\d+) #{color}/).flatten.all? { _1.to_i <= bag[color] }
    end

    m[:id].to_i
  end
end.compact

puts ids.sum
