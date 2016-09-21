require 'rails_helper'

RSpec.describe ContentsController, type: :controller do

  let(:content) { create(:content) }

  describe "GET #index" do

    it_should_behave_like "checking auth" do
      subject { get :index }
    end

    it_should_behave_like "user access" do
      subject { get :index }
    end

    it "assigns @titles" do
      create(:title)
      create(:title, user: user)

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

    it "assigns @content" do
      sign_in user
      get :new
      expect(assigns(:content)).to be_a Content
      expect(assigns(:content)).not_to be_persisted
    end

  end

  describe "GET #edit" do

    it_should_behave_like "checking auth" do
      subject { get :edit, params: {id: content.to_param} }
    end

    it_should_behave_like "user access" do
      subject { get :edit, params: {id: content.to_param} }
    end

    it "assigns @content" do
      sign_in user
      get :edit, params: {id: content.to_param}

      expect(assigns(:content)).to eq content
      expect(assigns(:content)).to be_persisted
    end

  end

  let(:valid_params) {
    {
      subject: 'subject2',
      content: 'content2',
      title_id: create(:title, user: user).id,
    }
  }

  let(:invalid_params) {
    {content: ''}
  }

  describe "POST #create" do

    it_should_behave_like "checking auth" do
      subject { post :create, params: {content: valid_params} }
    end

    it "create data" do
      sign_in user
      post :create, params: {content: valid_params}
      expect(Content.count).to eq 1
    end

    it "render :form when failed" do
      sign_in user
      post :create, params: {content: invalid_params}
      expect(response).to render_template :form
    end

  end

  describe "PUT #update" do

    it_should_behave_like "checking auth" do
      subject { put :update, params: {id: content.to_param, content: valid_params} }
    end

    it "update data" do
      sign_in user
      put :update, params: {id: content.to_param, content: valid_params}
      content.reload
      expect(content.subject).to eq 'subject2'
    end

    it "render :form when failed" do
      sign_in user
      post :create, params: {content: invalid_params}
      expect(response).to render_template :form
    end

  end

  describe "DELETE #destroy" do

    it_should_behave_like "checking auth" do
      subject { delete :destroy, params: {id: content.id} }
    end

    it "destroy data" do
      sign_in user
      delete :destroy, params: {id: content.id}

      expect(Content.count).to eq 0
    end

    it "redirect to index" do
      sign_in user
      delete :destroy, params: {id: content.id}

      expect(response).to redirect_to(action: :index)
    end

  end


end
