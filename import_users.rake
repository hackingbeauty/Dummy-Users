require 'rake'
require 'ar-extensions'
require 'faker'

namespace :import do
  desc "import 5 million dummy users"
  task :users => :environment do
    begin
      names = []
      10000.times do
        names.push [Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email]
      end
      fields = [:first_name,:last_name,:email]
      User.import fields, names, :validate => false 
     # p User.all
#    rescue StandardError => e
 #     puts "oops, you have an error: #{e.message}"
    end
  end
end
