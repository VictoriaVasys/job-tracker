FactoryGirl.define do 
  factory :job do
    title
    level_of_interest 70
    city "Denver"
  end

  sequence :title do |n|
    "Job #{n}"
  end 

  # sequence :title, ["A", "C", "B"].cycle do |n|
  #   "#{n} Title"
  # end 

  # factory :song do
  #   title
  #   artist
  # end
  # 
  sequence :company_name do |n|
    "Company #{n}"
  end 

  factory :company do
    name { generate(:company_name) }

    factory :company_with_jobs do
      jobs { create_list(:job, 3) }
    end
  end
end