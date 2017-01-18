class GroupsController < ApplicationController
  before_action :authenticate_user!, only: :index
  # before_action :set_group, only: [:edit, :update]
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
      # redirect_to group_messages_path(@group)
      # グループ作成テスト
      redirect_to new_group_path(@group), notice: '新規グループを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      # redirect_to group_messages_path(@group)

      # グループテスト
      redirect_to new_group_path(@group)
    else
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




  # def show
  #   # before_action :set_group, only: [:edit, :update, :show]
  # end
  # # def create
  # #   @group = Group.new(group_params)
  # #     if @group.save
  # #       redirect_to group_path(@group), notice: '新規グループを作成しました'
  # #     else
  # #       flash[:alert] = '新規グループ作成に失敗しました'
  # #       render :new
  # #     end
  # # end
  # def new
  #   @group = Group.new
  #   @group.users << current_user
  # end
  # def edit
  # end