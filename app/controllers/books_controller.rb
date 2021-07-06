class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ index show ]
  before_action :set_current, only: %i[ index]

  # GET /books or /books.json
  def index
    @books = if @current_category.id
               Book.by_category(@current_category.id).order(@sort_option).page params[:page]
             else
               Book.order(@sort_option).page params[:page]
             end

  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :price, :quantity, :description, :height, :width, :depth, :year_of_publication, :materials)
    end

  def set_categories
    @categories = Category.order('name')
  end



  def set_current
    @current_category = if params[:category_id] && Category.ids.include?(params[:category_id].to_i)
                          @categories.find(params[:category_id])
                        else
                          Category.new(id: nil, name: "All")
                        end
    @sort_by = params[:sort_by]
    if params[:sort_by] && SortOptions::sort_options.keys.include?(params[:sort_by].to_sym)
      @sort_name = SortOptions::sort_options[@sort_by.to_sym][:name]
      @sort_option =  SortOptions::sort_options[@sort_by.to_sym][:option]
    else
      @sort_name = 'Newest First'
      @sort_option = 'created_at DESC'
    end
  end
end
