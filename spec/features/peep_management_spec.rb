feature 'peep management' do

  context 'creating a peep' do
    scenario 'requires sign in' do
      visit '/peeps/new'
      expect(page).to have_content('You must sign up or sign in to create a peep')
    end

    # As a Maker
    # So that I can let people know what I am doing
    # I want to post a message (peep) to chitter
    scenario 'happens when signed in' do
      create_peep
      expect(page).to have_content('Hello world!')
    end
  end

  context 'viewing peeps' do

    let (:user2) do
      User.create(name: 'Mike Jones', username: 'mjones', email: 'mjones@test.com', password: '12345', password_confirmation: '12345')
    end

    scenario 'can see username next to peep' do
      create_peep
      sign_in(username: user2.username, password: user2.password)
      visit '/peeps/new'
      fill_in('content', with: 'Hello world again!')
      click_button('Peep!')
      expect(page).to have_content('User: mjones')
    end

    scenario 'can see peeps when not logged' do
      create_peep
      click_button 'Sign out'
      visit '/'
      expect(page).to have_content 'Hello world!'
    end

    # As a maker
    # So that I can see what others are saying
    # I want to see all peeps in reverse chronological order
    scenario 'peeps shown in reverse chronological order' do
      create_peep
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
    scenario 'peeps display timestamp' do
      create_peep
      test_time = Time.new
      allow(Time).to receive(:new) { test_time }
      expect(page).to have_content(test_time)
    end
  end

end
