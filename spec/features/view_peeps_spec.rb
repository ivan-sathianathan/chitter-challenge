# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'seeing peeps' do
  let (:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario 'when not logged in see peeps' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in('content', with: 'Hello world!')
    click_button 'Peep!'
    click_button 'Sign out'
    visit '/'
    expect(page).to have_content 'Hello world!'
  end
end
