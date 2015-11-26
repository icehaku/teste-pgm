require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid credentials' do
    visit "user/register/sign_up" 
    fill_in 'user_nome', with: Faker::Name.name
    fill_in 'user_email', with: Faker::Internet.email
    fill_in 'user_password', with: 'goku1234'     
	fill_in 'user_password_confirmation', with: 'goku1234'
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'without name' do
    visit "user/register/sign_up" 
    fill_in 'user_email', with: Faker::Internet.email    
    fill_in 'user_password', with: 'goku1234' 
	fill_in 'user_password_confirmation', with: 'goku1234'
    click_on 'Sign up'

    expect(page).to have_content('Nome nao pode ser vazio.')
  end

  scenario 'without email' do
    visit "user/register/sign_up" 
    fill_in 'user_nome', with: Faker::Name.name
    fill_in 'user_password', with: 'goku1234' 
	fill_in 'user_password_confirmation', with: 'goku1234'
    click_on 'Sign up'

    expect(page).to have_content("Email can't be blank")
  end

  scenario 'without password' do
    visit "user/register/sign_up" 
    fill_in 'user_nome', with: Faker::Name.name
    fill_in 'user_email', with: Faker::Internet.email
	fill_in 'user_password_confirmation', with: 'goku1234'
    click_on 'Sign up'

    expect(page).to have_content("Password can't be blank")
  end 

  scenario 'without password confirmation' do
    visit "user/register/sign_up" 
    fill_in 'user_nome', with: Faker::Name.name
    fill_in 'user_email', with: Faker::Internet.email
	fill_in 'user_password', with: 'goku1234'
    click_on 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end    

  scenario 'with password mismatch' do
    visit "user/register/sign_up" 
    fill_in 'user_nome', with: Faker::Name.name
    fill_in 'user_email', with: 'goku@gmail.com'
	fill_in 'user_password', with: 'goku1234'    
	fill_in 'user_password_confirmation', with: 'goku12345'
    click_on 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end        
end