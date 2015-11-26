require 'rails_helper'

feature 'Guest Post' do
  scenario 'with valid params' do
    visit root_path 
    fill_in 'post_nome', with: Faker::Name.name
    fill_in 'post_content', with: Faker::Hipster.sentence(10)

    click_on 'Blogar!'

    expect(page).to have_content('Postado com Sucesso!')
  end

  scenario 'without valid name' do
    visit root_path
    fill_in 'post_content', with: Faker::Hipster.sentence(10) 

    click_on 'Blogar!'

    expect(page).to have_content('Nome nao pode ser vazio ou Logue-se!')
  end

  scenario 'without valid content' do
    visit root_path
    fill_in 'post_nome', with: Faker::Name.name 

    click_on 'Blogar!'

    expect(page).to have_content('Content nao pode ser vazia.')
  end  

  scenario 'content too big' do
    visit root_path
    fill_in 'post_nome', with: Faker::Name.name
    fill_in 'post_content', with: Faker::Hipster.sentence(1000) 

    click_on 'Blogar!'

    expect(page).to have_content('Content nao pode ser maior que 500 caracteres.')
  end    

end