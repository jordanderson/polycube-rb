require "bundler/gem_tasks"
require "rake/testtask"
require "pp"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc "Run console with polycube gem loaded"
task :console do
  require 'irb'
  require 'irb/completion'
  require 'polycube'
  ARGV.clear
  IRB.start
end
