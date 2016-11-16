#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/reloader'
require 'figaro'
require 'csv'
require 'thin'

require_relative 'lib/scraper'
require_relative 'lib/dice_jobs_page_parser'
require_relative 'lib/job_writer'
require_relative 'lib/dice_scraper_controller'

# Figaro.application = Figaro::Application.new(
#   environment: 'development',
#   path: File.expand_path('../config/application.yml', __FILE__)
# )
# Figaro.load
#
# key = ENV['dice']

get '/' do
  # search
  jobs = CSV.read("test.csv")
  erb :index, locals: { jobs: jobs }
end

post '/' do
  keyword = params[:keyword]
  location = params[:location]

  jobs = DiceScraperController.new.search(keyword, location)
  JobWriter.new.save_results('test.csv', jobs)
  # invokes scraper
    # writes csv
  redirect '/'
end
