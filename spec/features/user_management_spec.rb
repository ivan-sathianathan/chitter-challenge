feature "managing users" do

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter

  context 'signing up' do
    scenario "requires a matching password" do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change( User, :count )
      expect(current_path).to eq ('/users')
      expect(page).to have_content "Password and confirmation password do not match"
    end
    scenario "increases user count" do
      expect { sign_up }.to change( User, :count ).by(1)
    end
    scenario "displays a welcome message" do
      sign_up
      expect(page).to have_content("Welcome, Ivan Sathianathan")
    end
  end

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to log in to Chitter

  let (:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario 'signing in require correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

  scenario 'signing in does not occur with incorrect credentials' do
    sign_in(username: user.username, password: "incorrect_password")
    expect(page).to have_content "Incorrect username or password"
  end

  # As a Maker
  # So that I can avoid others posting messages on Chitter as me
  # I want to log out of Chitter
  scenario "signing out displays a goodbye message" do
    sign_in(username: user.username, password: user.password)
    click_button('Sign out')
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content 'Welcome, Ivan Sathianathan'
  end  
end
