class BooksController < ApplicationController
  # booksページ
  def index
    @book = Book.new
    @books = Book.all
  end
  
  # 保存機能
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  # 詳細画面
  def show
    @book = Book.find(params[:id])
  end

  # 編集画面
  def edit
    @book = Book.find(params[:id])
  end
  
  # 更新
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end
  
  # 削除機能
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
