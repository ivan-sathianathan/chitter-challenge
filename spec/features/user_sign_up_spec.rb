# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature "On sign up" do
  scenario "user count increases" do
    expect { sign_up }.to change( User, :count ).by(1)
  end
  scenario "a welcome message is displayed" do
    sign_up
    expect(page).to have_content("Welcome, Ivan Sathianathan")
  end
  scenario "email is stored in database" do
    sign_up
    expect(User.first.email).to eq "ivan@test.com"
  end
end
