# frozen_string_literal: true

require 'rubocop/rake_task'

task default: [:lint]

desc 'Lint project by running Rubocop'
task lint: [:rubocop]

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-performance'
  task.requires << 'rubocop-rake'
end
