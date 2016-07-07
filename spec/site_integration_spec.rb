require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the site path', {:type => :feature}) do
  it('has a user enter a name and submit the dealership form, the site creates a dealership under that name, then has the user create a new vehicle and add it to their dealership') do
    visit('/')
    click_on('Add New Dealership')
    fill_in('name', :with => "Noah's Cars")
    click_on('Add Dealership')
    expect(page).to have_content('Success!')
    click_on('See all Dealerships')
    expect(page).to have_content("Noah's Cars")
    click_on("Noah's Cars")
    expect(page).to have_content('Here are all of the cars in this dealership:')
    click_on('Add a new vehicle')
    fill_in('make', :with => "Honda")
    fill_in('model', :with => "Civic")
    fill_in('year', :with => "2001")
    click_on('Add Vehicle')
    expect(page).to have_content('Success!')
    click_on('See Vehicles')
    expect(page).to have_content('Honda Civic 2001')
    click_on('Return to Main Page')
    click_on('See Dealership List')
    expect(page).to have_content('All Dealerships')
  end
end
