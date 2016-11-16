#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/reloader'
require 'figaro'
require 'csv'
# require 'thin'

# Figaro.application = Figaro::Application.new(
#   environment: 'development',
#   path: File.expand_path('../config/application.yml', __FILE__)
# )
# Figaro.load
#
# key = ENV['dice']

get '/' do
  # search
  # jobs = CSV.read("test.csv")
  erb :index, locals: { jobs: jobs }
end

post '/' do
  # invokes scraper
    # writes csv
  # redirect '/'
end