require 'rake'
require 'ar-extensions'
require 'faker'

namespace :import do
  desc "import 5 million dummy users"
  task :users => :environment do
    begin_time = Time.now
    begin
      names = []
      10000.times do |x|
        names.push ["test-#{x}-first-name","test-#{x}-last-name", "test-#{x}-email@email.com"]
        names.push 
      end
      fields = [:first_name,:last_name,:email]
      User.import fields, names, :validate => false 
     # p User.all
    rescue StandardError => e
      puts "oops, you have an error: #{e.message}"
    end
  end_time = Time.now
  total_time = end_time - begin_time
  puts total_time
  end
end
