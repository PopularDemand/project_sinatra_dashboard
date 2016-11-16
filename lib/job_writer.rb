require 'csv'

class JobWriter

  def save_results(filepath, results)

    CSV.open(filepath, 'w') do |csv|
      # each one of these comes out in its own row.
      csv << ["Job Title", "Company", "Link", "Location", "Posting Date", "Company ID", "Job ID"]

      results.each do |job|
        csv << job.to_a
      end
    end
  end

end
