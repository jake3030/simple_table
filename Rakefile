require 'rubygems'
require 'bundler/setup'

desc 'Run all adva tests'
task :test_all do
  STDOUT.sync = true
  system('ruby test/all.rb')
  state = $?
  exit(state.exitstatus) if state.exited? and state.exitstatus != 0
end

task :default => [:test_all]
