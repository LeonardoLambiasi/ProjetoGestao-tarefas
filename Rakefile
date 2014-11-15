require 'rake/testtask'

task :default => 'test:all'

TEST_FILES = FileList['refactory/test/*.rb']

namespace :test do
  desc "Run all tests"
  Rake::TestTask.new(:all) do |t|
    t.test_files = TEST_FILES
  end

  rule /^test:/ => lambda { |tn| "refactory/test/%s.rb" % tn.gsub(/^test:/,'') } do |rule|
  	puts rule.source
    ruby rule.source
  end
end