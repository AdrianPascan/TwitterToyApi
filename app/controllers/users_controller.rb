class UsersController < ApplicationController

  before_action :set_user, only: %i[ update destroy personal_feed profile_feed ]

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /users/feed/1 or /users/feed/1.json
  def feed
    @posts = user.posts

    respond_to do |format|
      format.html { render :feed, status: :ok }
      format.json { render json: @posts, status: :ok }
    end
  end

  # GET /users/feed/subscriptions/1 or /users/feed/subscriptions/1.json
  def subscriptions_feed
    subscribed = Subscription.where(subscriber: @user).pluck(:subscribed_id)
    @posts = Post.where(user_id: subscribed).includes(:comments, :reactions)

    respond_to do |format|
      format.html { render :subscriptions_feed, status: :ok }
      format.json { render json: @posts, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
