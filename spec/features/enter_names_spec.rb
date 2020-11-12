feature 'Testing player registration' do
  scenario 'players will names in a form, submit form and see names on screen' do
    sign_in_and_play
    expect(page).to have_content 'Mel vs. Lucy'
  end
end
