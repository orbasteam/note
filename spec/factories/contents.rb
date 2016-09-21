FactoryGirl.define do
  factory :content do

    user
    title do
      create(:title, user: user)
    end
    subject "subject"
    content "content"

  end

end
