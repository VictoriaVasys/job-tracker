require 'rails_helper'

RSpec.feature "User deletes an existing job" do
  scenario "they are redirected to the jobs index and do not see the job title" do
    company        = Company.create(name: "ESPN")
    job            = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver")
    
    visit company_job_path(company, job)
    click_on "Delete"

    expect(page).to_not have_content("#{job.title} at #{job.company.name}")
  end
end