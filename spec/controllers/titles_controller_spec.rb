require 'rails_helper'

RSpec.describe TitlesController, type: :controller do

  let(:title) { create(:title) }

  render_views

  describe "GET #index" do

    it_should_behave_like "checking auth" do
      subject { get :index }
    end

    it_should_behave_like "user access" do
      subject { get :index }
    end

    it "assigns @titles" do
      create(:title, user: user)
      create(:title)

      sign_in user
      get :index

      expect(assigns(:titles).count).to eq 1
    end

  end

  describe "GET #new" do

    it_should_behave_like "checking auth" do
      subject { get :new }
    end

    it_should_behave_like "user access" do
      subject { get :new }
    end

    it "assigns @title" do
      sign_in user
      get :new
      expect(assigns(:title)).to be_a Title
      expect(assigns(:title)).not_to be_persisted
    end

  end

  let(:valid_params) {
    {name: 'name'}
  }

  let(:invalid_params) {
    {name: ''}
  }

  describe "POST #create" do

    it_should_behave_like "checking auth" do
      subject { post :create }
    end

    it "redirect to index" do
      sign_in user
      post :create, params: {title: valid_params}
      expect(response).to redirect_to(action: :index)
    end

    it "create title" do
      sign_in user
      post :create, params: {title: valid_params}
      expect(Title.last.name).to eq 'name'
    end

    it "render :form when failed" do
      sign_in user
      post :create, params: {title: invalid_params}
      expect(response).to render_template :form
    end

  end

  describe "GET #edit" do

    it_should_behave_like "checking auth" do
      subject { get :edit, params: { id: title.to_param } }
    end

    it_should_behave_like "user access" do
      subject { get :edit, params: { id: title.to_param } }
    end

    it "assigns @title" do
      sign_in user
      get :edit, params: { id: title.to_param }

      expect(assigns(:title)).to eq Title.find(title.to_param)
      expect(assigns(:title)).to be_persisted
    end

  end

  describe "PUT #update" do

    it_should_behave_like "checking auth" do
      subject { put :update, params: { id: title.to_param }}
    end

    it "redirect to index" do
      sign_in user
      put :update, params: {id: title.id, title: valid_params}
      expect(response).to redirect_to(action: :index)
    end

    it "update data" do
      sign_in user
      put :update, params: { id: title.id, title: valid_params}
      expect(assigns(:title).name).to eq 'name'
    end

    it "render :form when failed" do
      sign_in user
      put :update, params: { id: title.id, title: invalid_params}
      expect(response).to render_template :form
    end

  end

  describe "GET #sort" do

    it_should_behave_like "checking auth" do
      subject { get :sort, params: { id: title.to_param, position: 1}}
    end

    it_should_behave_like "user access" do
      subject { get :sort, params: { id: title.to_param, position: 1}}
    end

    it "update position" do
      create(:title, user: user)
      title2 = create(:title, user: user)
      sign_in user
      get :sort, params: { id: title2.to_param, position: 1}

      expect(Title.first).to eq title2
    end

  end

end
