class HomeController < ApplicationController

    def index
      
    end

    def about
    end

    def hair
      @creates = Create.all
    end

    def devlop
    end

    def admin
    end

    def login
      @user = User.find_by(email: params[:email], password: params[:password])
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "You have successfully login"
        redirect_to("/hair")
      else
        @error_message = "Invalide email or password"
        @email = params[:email]
        @password = params[:password]
        render("admin")
      end

    end

    def ikendu
     @create = Create.new
     @create = Create.find_by(id: params[:id]) 
    end

    def create_admin
      @create = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password]
        )
      if @create.save
        flash[:notice] = "Admin successfully created"
        redirect_to("/admin")
      else
        render("new_admin")
      end
    end

    def new
      @create = Create.new
      @creates = Create.find_by(id: params[:id])
    end

    def show
      @create = Create.find_by(id: params[:id])
    end


    def add
      @create = Create.new(
        name: params[:name], 
        makers: params[:makers], 
        color: params[:color], 
        price: params[:price],
        image: "logoo.jpg"
        )
      if @create.save
        flash[:notice] = "successfully created"
        redirect_to("/home/#{@create.id}")
      else
        render("create/new")
      end
    end

    def edit
      @create = Create.find_by(id: params[:id])
    end

    def update 
      @create = Create.find_by(id: params[:id])

      @create.name = params[:name]
      @create.makers = params[:makers]
      @create.color = params[:color]
      @create.price = params[:price]

      if params[:image]
        @create.image = "#{@create.id}.jpg"
        image = params[:image]
        File.binwrite("public/files/#{@create.image}", image.read)
      end
      if @create.save
        flash[:notice] = "Update successfully created"
        redirect_to("/home/#{@create.id}")
      else
        render("home/edit")
      end
    end

    def logout
      session[:user_id] = nil
      flash[:notice] = "You have successfully signed out"
      redirect_to("/admin")
    end

    def destroy
      @create = Create.find_by(id: params[:id])
      @create.destroy
      flash[:notice] = "Post successfully deleted"
      redirect_to("/hair")
    end


end
