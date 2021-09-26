class PostImagesController < ApplicationController
  
def new
  @post_image = PostImage.new
end 

# 投稿データの保存
def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
end

def index
 @post_images = PostImage.page(params[:page]).reverse_order
  # 下記の記述では一覧画面に全ての投稿画像が表示されデータが重くなる
  # @post_images = PostImage.all
  # それを回避するために下記の記述に直す（kaminariがページャで利用するテンプレートを作成）
  
end 

def show
  @post_image = PostImage.find(params[:id])
  @post_comment = PostComment.new
end 

def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
end 

# 投稿データのストロングパラメータ
private

def post_image_params
  params.require(:post_image).permit(:shop_name, :image, :caption)
end

end
