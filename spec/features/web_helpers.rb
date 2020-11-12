
def sign_in_and_play
  visit('/')
  fill_in :name1, with: 'Mel'
  fill_in :name2, with: 'Lucy'
  click_button 'Submit'
end
