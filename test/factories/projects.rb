FactoryBot.define do
  factory :project do
    name "MyString"
    categories 'rails'
    order { Random.rand }
    displayed true
    shortname Faker::MostInterestingManInTheWorld.quote
    content Faker::MostInterestingManInTheWorld.quote
    summary Faker::MostInterestingManInTheWorld.quote
    isArticle false
    markdown true
    content_markdown Faker::Markdown.table
    sticky false
    website false
    large_modal false
    image_dir 'testproject'
  end
end
