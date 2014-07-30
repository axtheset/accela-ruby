require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'

task default: %w[spec:unit spec:integration]

RSpec::Core::RakeTask.new("spec:unit") do |t|
  t.pattern = "spec/unit/**/*_spec.rb"
end

RSpec::Core::RakeTask.new("spec:integration") do |t|
  t.pattern = "spec/integration/**/*_spec.rb"
end

desc "Build gem"
task :gem do
  exec 'gem build accela.gemspec'
end

desc "Run developer console with pry"
task :console do
  sh 'pry', '--gem'
end

task clean: %w[clean:gem clean:cassettes]

desc "Cleans generated gem"
task "clean:gem" do
  rm_f Dir.glob('*.gem')
end

desc "Cleans cassettes"
task "clean:cassettes" do
  rm_f Dir.glob('spec/cassettes/**/*.yml')
end
