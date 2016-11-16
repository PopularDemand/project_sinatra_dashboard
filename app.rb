#!/usr/bin/env ruby
require 'sinatra'
require 'figaro'
require 'sinatra/reloader' if development?

# Figaro.application = Figaro::Application.new(
#   environment: 'development',
#   path: File.expand_path('../config/application.yml', __FILE__)
# )
# Figaro.load
#
# key = ENV['dice']
