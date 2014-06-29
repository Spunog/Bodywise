class GoalsController < ApplicationController
  before_action :get_user, only: [:index,:show,:edit,:update,:destroy,:new,:create]
  before_action :set_goal, only: [:show,:update,:destroy]
  before_filter :authenticate_user! #, :except => [:show, :index]

  # GET /goals
  # GET /goals.json
  def index
    @goals = @user.goals.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
    @goal = @user.goals.last
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = @user.goals.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to goal_path, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goal_path, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = @user.goals.last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:weight_lbs)
    end

    def get_user
      @user = current_user
    end

end
