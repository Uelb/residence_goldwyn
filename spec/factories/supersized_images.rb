# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :supersized_image, :class => 'SupersizedImages' do
    visible false
  end
end
