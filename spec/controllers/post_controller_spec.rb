require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe "GET #index" do
		it "responds successfully" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end
	end

	describe 'POST #create' do
		context 'with valid attributes' do
			it 'creates the post' do
				post :create, post: attributes_for(:post)
				expect(Post.count).to eq(1)
			end

			it 'redirects to the "index" action to show the new post' do
				post :create, post: attributes_for(:post)
			end
		end

		context 'with invalid content' do
			it 'does not create the post' do
				post :create, post: attributes_for(:post, content: nil)
				expect(Post.count).to eq(0)
			end

			it 're-render index to show errors' do
				post :create, post: attributes_for(:post, content: nil)
				expect(response).to render_template("index")
			end
		end
	end	

end