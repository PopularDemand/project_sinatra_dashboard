# TO DO:
.gitignore
  *.csv
  config/*

require 'sinatra/reloader' if development?

deployment: config.ru

# FILES:
  app.rb (run exe code, routing)
    get /
      search form
      erb :index
      update index.erb
        display results table from csv
    post /
      kick off the scraper => array of structs
      results obj
        write results to csv
      redirect to get /
  lib/
    scraper.rb => array of Job structs
  helpers/
    modules
    helper methods?
  views/
    index.erb
      bootstrap
    layout.erb
  public/
    CSS

# do now
  write index.erb from existing csv
  get scraper to work with sinatra
