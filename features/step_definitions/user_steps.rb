Given("I am a logged user with {string} as a name") do |name|
  user = create(:user, name:name, password: 'abc1234')
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: 'abc1234'
  click_on 'Log in'
end

Given("with a created user called {string}") do |username|
  create(:user, username: username)
end

Given("I am in the users page") do
  visit users_url
end

When("I click on the {string} button") do |photo|
  click_on photo
end

Then("I should see {string} details") do |photo|
  expect(page).to have_content(photo)
end

Given("I am a logged user with {string} as a name") do |name|
  user = create(:user, name:name, password: 'abc1234')
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: 'abc1234'
  click_on 'Log in'
end

Given("I am in the user page") do
  visit users_url
end

When("I click on the {string} button on the {string} card") do |follow, name|
  click_on follow
end

Then("{string} should follow {string}") do |string, string2|
  user1 = User.find_by(name: name)
  user2 = User.find_by(name: name2)
  expect(user1.following).to include(user2)
end


