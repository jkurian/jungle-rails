require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
        User.create!(
          firstname: 'test',
          lastname: 'user',
          email: 'test_user@gmail.com',
          password: 'testuser',
          password_confirmation: 'testuser'
        )
  end
  after(:each) do
    User.delete_all
    Product.delete_all
    Category.delete_all
  end
    scenario "The cart is updated" do
      # ACT
      visit root_path

      #Login to webpage
      click_on('Login')

      #Fill in form details
      fill_in 'email', :with => 'test_user@gmail.com'
      fill_in 'password', :with => 'testuser'

      #Submit form
      click_on('Submit')

      #click on product
      click_link('Add', match: :first)
      
      expect(page).to have_content 'My Cart (1)'
      save_screenshot
    end
end
