class WeightsController < ApplicationController
  before_action :get_user, only: [:index,:show,:edit,:update,:destroy,:new,:create,:graph]
  before_action :set_weight, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! #, :except => [:show, :index]

  # GET /weights
  # GET /weights.json
  def index

    order = (params[:order]=="ASC") ? '"dateWeighted" ASC' : '"dateWeighted" DESC'
    per_page = (params.has_key?(:per_page) && params[:per_page].to_i != 0) ? params[:per_page].to_i : 7

    @weights = @user.weights.order(order).page(params[:page]).per_page(per_page)
    @graphURL = weights_graph_path

    # respond_to do |format|
    #     format.html
    #     format.json { render json: @weights.as_json(only: [:date,:weight_lbs]) }
    # end

  end

  def graph
    limit = (params.has_key?(:limit) && params[:limit].to_i != 0) ? params[:limit].to_i : 7
    @weights = @user.weights.order('"dateWeighted" DESC').limit(limit).reverse
    @graphURL = weights_graph_path + '?limit=31' #default limit, will call this controller for json again, kinda weird, but think its ok?
  end

  # GET /weights/1
  # GET /weights/1.json
  def show
  end

  # GET /weights/new
  def new
    @weight = Weight.new
  end

  # GET /weights/1/edit
  def edit

  end

  # POST /weights
  # POST /weights.json
  def create
    @weight = @user.weights.new(weight_params)

    respond_to do |format|
      if @weight.save
        format.html { redirect_to weights_path, notice: 'Weight was successfully created.' }
        format.json { render :show, status: :created, location: @weight }
      else
        format.html { render :new }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weights/1
  # PATCH/PUT /weights/1.json
  def update
    respond_to do |format|
      if @weight.update(weight_params)
        format.html { redirect_to weights_path, notice: 'Weight was successfully updated.' }
        format.json { render :show, status: :ok, location: @weight }
      else
        format.html { render :edit }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.json
  def destroy
    @weight.destroy
    respond_to do |format|
      format.html { redirect_to weights_url, notice: 'Weight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight
      @weight = @user.weights.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_params
      params.require(:weight).permit(:dateWeighted, :weight_lbs)
    end

    def get_user
      @user = current_user
    end

end
