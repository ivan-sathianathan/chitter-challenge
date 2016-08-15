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

  scenario 'view peeps in reverse chronological order' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in('content', with: 'Hello world!')
    click_button 'Peep!'
    visit '/peeps/new'
    fill_in('content', with: 'Hello world, again!')
    click_button 'Peep!'
    visit '/'
    expect(page.find('li:nth-child(1)')).to have_content 'User: ivan Peep: Hello world, again!'
    expect(page.find('li:nth-child(2)')).to have_content 'User: ivan Peep: Hello world!'
  end

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
  scenario 'has a timestamp next to each peep' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in('content', with: 'Hello world!')
    click_button 'Peep!'
    test_time = Time.new
    allow(Time).to receive(:new) { test_time }
    expect(page).to have_content(test_time)
  end
end
