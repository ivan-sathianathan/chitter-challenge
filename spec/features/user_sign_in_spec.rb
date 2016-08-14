# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature "On sign in" do

  let (:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  scenario 'with incorrect credentials' do
    sign_in(username: user.username, password: "incorrect_password")
    expect(page).to have_content "Incorrect username or password"
  end
end
