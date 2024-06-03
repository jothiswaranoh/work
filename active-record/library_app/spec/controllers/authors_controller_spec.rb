
require 'rails_helper'


RSpec.describe AuthorsController, type: :controller do
  describe "GET #index" do
    it "assigns all authors to @authors" do
      author1 = Author.create(name: "Author 1")
      author2 = Author.create(name: "Author 2")

      get :index

      expect(assigns(:authors)).to eq([author1, author2])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested author to @author" do
      author = Author.create(name: "Test Author")

      get :show, params: { id: author.id }

      expect(assigns(:author)).to eq(author)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new author to @author" do
      get :new

      expect(assigns(:author)).to be_a_new(Author)
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new author" do
        author_params = { name: "New Author" }

        expect {
          post :create, params: { author: author_params }
        }.to change(Author, :count).by(1)

        expect(response).to redirect_to(authors_path)
        expect(flash[:notice]).to eq('Author was successfully created.')
      end
    end

    context "with invalid parameters" do
      it "does not create a new author" do
        author_params = { name: "" } # Invalid name

        expect {
          post :create, params: { author: author_params }
        }.not_to change(Author, :count)

        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested author to @author" do
      author = Author.create(name: "Test Author")

      get :edit, params: { id: author.id }

      expect(assigns(:author)).to eq(author)
      expect(response).to render_template("edit")
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the author" do
        author = Author.create(name: "Old Name")
        new_author_params = { name: "New Name" }

        patch :update, params: { id: author.id, author: new_author_params }

        author.reload
        expect(author.name).to eq("New Name")

        expect(response).to redirect_to(authors_path)
        expect(flash[:notice]).to eq('Author was successfully updated.')
      end
    end

    context "with invalid parameters" do
      it "does not update the author" do
        author = Author.create(name: "Old Name")
        invalid_author_params = { name: "" } # Invalid name

        patch :update, params: { id: author.id, author: invalid_author_params }

        author.reload
        expect(author.name).to eq("Old Name")

        expect(response).to render_template("edit")
      end
    end
  end

  # Add similar tests for delete action as needed.

end
