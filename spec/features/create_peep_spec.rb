feature 'creating a peep' do
  scenario 'requires sign in' do
    visit '/peeps/new'
    expect(page).to have_content('You must sign up or sign in to create a peep')
  end

  let (:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  let (:user2) do
    User.create(name: 'Mike Jones', username: 'mjones', email: 'mjones@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario 'creates peep when when signed in' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in('content', with: 'Hello world!')
    click_button('Peep!')
    expect(page).to have_content('Hello world!')
  end

  scenario 'displays username next to peep' do
    sign_in(username: user.username, password: user.password)
    visit '/peeps/new'
    fill_in('content', with: 'Hello world!')
    click_button('Peep!')
    sign_in(username: user2.username, password: user2.password)
    visit '/peeps/new'
    fill_in('content', with: 'Hello world again!')
    click_button('Peep!')
    expect(page).to have_content('User: mjones')
  end
end
