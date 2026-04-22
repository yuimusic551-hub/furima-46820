class ItemsController < ApplicationController
  # ログインしていないユーザーをログイン画面へ飛ばす（indexとshow以外）
  before_action :authenticate_user!, except: [:index, :show]
  # 指定のアクションの時だけ、事前に商品データを取得する
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # 出品者本人でない場合はトップページへ戻す（編集・更新・削除のみ）
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    # すでに set_item で @item が作られているので、中身は空でOK
  end

  def update
    if @item.update(item_params)
      # 更新に成功したら詳細画面へ戻る
      redirect_to item_path(@item.id)
    else
      # 失敗したら編集画面を再表示
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # 商品を削除してトップページへ戻る
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :item_name, :description, :category_id, :condition_id,
      :shipping_fee_id, :prefecture_id, :shipping_day_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if current_user.id == @item.user_id

    redirect_to root_path
  end
end
