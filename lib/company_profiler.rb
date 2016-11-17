require 'httparty'
require 'pp'

class CompanyProfiler

  ID = ENV["GLASSDOOR_ID"]
  KEY = ENV["GLASSDOOR_KEY"]
  IP = ENV["MY_IP"]
  USER_AGENT = "Windows%20Chrome"

  def initialize(jobs)
    @companies = filter_jobs(jobs)
  end

  def search(terms)
    base_url = "http://api.glassdoor.com/api/api.htm?"
    parameters = "t.p=#{ID}&t.k=#{KEY}&userip=#{IP}&useragent=#{USER_AGENT}&format=json&v=1&action=employers"
    query = "&q=#{terms}"
    url = "#{base_url}#{parameters}#{query}"
    sleep(0.5)
    HTTParty.get(url)
  end

  def company_profiles
    profiles = {}
    @companies.each do |company|
      profiles[company] = search(company)
    end
    pp profiles
    profiles
  end

  def filter_jobs(jobs)
    company_names = []
    jobs.each do |job|
      company_names << job.company
    end
    company_names
  end

  def write
    CSV.open('glassdoor.csv', 'w') do |csv|
      csv << ["Job Title", "Company", "Link", "Location", "Posting Date", "Company ID", "Job ID"]

      results.each do |job|
        csv << job.to_a
      end
    end
  end
end

# url = build_url("Kane Partners")

# p url

# response = HTTParty.get(url)

# pp response["response"]["employers"][0]["exactMatch"]

# pp response["response"]["employers"][0]["cultureAndValuesRating"]

# pp response["response"]["employers"][0]["featuredReview"]
