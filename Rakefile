require          'bundler/setup'
require          'sinatra'
require          'sinatra/activerecord/rake'
require_relative 'config/database'

desc "Launch a console with our environment loaded"
task :console do
  require          'irb'
  require_relative 'lib/bloggter'
  ARGV.clear
  $PROGRAM_NAME = 'irb'
  IRB.start
end

task :import_old_data do
  
end