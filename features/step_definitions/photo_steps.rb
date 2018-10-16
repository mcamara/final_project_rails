Given("I am a logged user with {string} as a name") do |name|
  user = create(:user, name:name, password: 'abc1234')
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: 'abc1234'
  click_on 'Log in'
end

Given("there is a photo called {string}") do |title|
  create(:photo, title: title)
end

Given("user goes to the photos page") do
  visit(root_url)
end

When("I click on {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see the photo details for {string}") do |title|
  photo = Photo.find_by(title: title)
  expect(page).to have_content(photo.title)
  expect(page).to have_content(photo.description)
end