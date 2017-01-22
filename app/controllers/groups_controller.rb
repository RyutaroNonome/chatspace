class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_group, only: [:edit, :update]
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      # redirect_to group_messages_path(@group) ← メッセージで使うはず
      # グループ作成テスト ← のちほどパス変えるかも
      redirect_to new_group_path, notice: '新規グループを作成しました(｀・ω・´)ｂ'
    else
      flash[:alert] = '新規グループ作成に失敗しました(´・ω・｀)'
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      # redirect_to group_messages_path(@group)

      # グループ編集テスト ← のちほどパス変えるかも
      redirect_to new_group_path, notice: 'グループを編集しました(｀・ω・´)ｂ'
    else
      flash[:alert] = 'グループ編集に失敗しました(´・ω・｀)'
      render :edit
    end
  end

  private

  def set_group
    @group = Group.includes(:users).find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end