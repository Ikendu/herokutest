class DecoController < ApplicationController

  def page
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      desc: params[:desc], 
      deco_image: "logooo.jpg"
      )
    if @post.save
      flash[:notice] = "Post successfully saveed"
      redirect_to("/deco/#{@post.id}")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.desc = params[:desc]
    if params[:image]
      @post.deco_image = "#{@post.id}.jpg"
      deco_image = params[:image]
      File.binwrite("public/deco_files/#{@post.deco_image}", deco_image.read)
    end
    if @post.save
      flash[:notice] = "Update is Successful"
      redirect_to("/deco/#{@post.id}")
    else
      render("deco/edit")
    end

  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted"
    redirect_to("/deco/page")
  end



end
