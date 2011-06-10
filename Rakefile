require 'bundler'
Bundler::GemHelper.install_tasks

multitask :default => 'test:ruby'

require 'rake/testtask'
namespace :test do
  desc %(Run all tests)
  multitask :all => ['test:all_rubies']

  desc %(Test Ruby code)
  Rake::TestTask.new(:ruby) do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/*/cases/**/test_*.rb'
    test.verbose = true
  end

  task :all_rubies do
    system "rvm ruby-1.8.7@client_side_validations-rails_2,ruby-1.9.2@client_side_validations-rails_2 rake test:ruby"
  end
end
