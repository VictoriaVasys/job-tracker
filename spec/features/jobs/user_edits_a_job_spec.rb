require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "they see the updated data for the individual job" do
    company = create(:company_with_jobs)
    job, job2, job3 = company.jobs
    
    updated_title  = "Back-End Engineer"
    
    visit company_job_path(company, job)
    click_on "Edit"
    fill_in "job_title", with: updated_title
    click_on "Update Job"

    expect(page).to have_content updated_title
    expect(page).to_not have_content job.title
  end
end