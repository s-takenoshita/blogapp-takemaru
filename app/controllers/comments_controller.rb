class CommentsController < ApplicationController

    def new
        article= Article.find(params[:article_id])
        @comment = article.comments.build
    end

    def index
        article= Article.find(params[:article_id])
        comments = article.comments
        render json: comments
    end

    def create
        article = Article.find(params[:article_id])
        @comment = article.comments.build(comments_params)
        if @comment.save
            redirect_to article_path(article), notice: 'コメントを追加しました。'
        else
            flash.now[:error] = '保存に失敗しました。'
            render :new
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:content)
    end
end
