class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        if params[:search] == nil
            @posts= Post.all
        elsif params[:search] == ''
            @posts= Post.all
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
        @posts = @posts.page(params[:page]).per(3)
        if params[:tag]
            Tag.create(name: params[:tag])
        end
    end

    def casual
        @posts = Post.where(genre:"カジュアル")
        if params[:search] == nil
            @posts= Post.where(genre:"カジュアル")
        elsif params[:search] == ''
            @posts= Post.where(genre:"カジュアル")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def natural
        @posts = Post.where(genre:"ナチュラル")
        if params[:search] == nil
            @posts= Post.where(genre:"ナチュラル")
        elsif params[:search] == ''
            @posts= Post.where(genre:"ナチュラル")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def modern
        @posts = Post.where(genre:"モダン")
        if params[:search] == nil
            @posts= Post.where(genre:"モダン")
        elsif params[:search] == ''
            @posts= Post.where(genre:"モダン")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def classic
        @posts = Post.where(genre:"クラシック")
        if params[:search] == nil
            @posts= Post.where(genre:"クラシック")
        elsif params[:search] == ''
            @posts= Post.where(genre:"クラシック")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def orthodox
        @posts = Post.where(genre:"オーソドックス")
        if params[:search] == nil
            @posts= Post.where(genre:"オーソドックス")
        elsif params[:search] == ''
            @posts= Post.where(genre:"オーソドックス")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def elegant
        @posts = Post.where(genre:"エレガント")
        if params[:search] == nil
            @posts= Post.where(genre:"エレガント")
        elsif params[:search] == ''
            @posts= Post.where(genre:"エレガント")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def chic
        @posts = Post.where(genre:"シック")
        if params[:search] == nil
            @posts= Post.where(genre:"シック")
        elsif params[:search] == ''
            @posts= Post.where(genre:"シック")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def urban
        @posts = Post.where(genre:"アーバン")
        if params[:search] == nil
            @posts= Post.where(genre:"アーバン")
        elsif params[:search] == ''
            @posts= Post.where(genre:"アーバン")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def mannish
        @posts = Post.where(genre:"マニッシュ")
        if params[:search] == nil
            @posts= Post.where(genre:"マニッシュ")
        elsif params[:search] == ''
            @posts= Post.where(genre:"マニッシュ")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def ethnic
        @posts = Post.where(genre:"エスニック")
        if params[:search] == nil
            @posts= Post.where(genre:"エスニック")
        elsif params[:search] == ''
            @posts= Post.where(genre:"エスニック")
        else
            #部分検索
            @posts = Post.where("genre LIKE ? OR time LIKE ? OR price LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%','%' + params[:search] + '%')
        end
    end

    def new
        @post = Post.new
    end
    
    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
          redirect_to :action => "show", :id => post.id
        else
          redirect_to :action => "new"
        end
      end

    private
    def post_params
        params.require(:post).permit(:genre, :price, :image, :about, :tagu, tag_ids: [])
    end
end
