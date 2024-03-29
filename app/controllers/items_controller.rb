class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!
  before_action :correct_user, only: [:edit, :destroy]

  # GET /items or /items.json
  def index
    @items = Item.all.order(:created_at => :desc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "posts", template: "items/post_index", formats: [:html]
      end
    end
  end

  # GET /items/1 or /items/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "post_#{@item.id}", template: "items/post", formats: [:html]
      end
    end
  end

  # GET /items/new
  def new
    # @item = Item.new
    @item = Current.user.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    # @item = Item.new(item_params)
    @item = Current.user.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_url }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_url }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def correct_user
    @item = Current.user.items.find_by(id: params[:id])
    redirect_to login_path, notice: "This account is not authorised to do that" if @item.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :URL, :tags, :image, :user_id, :remove_image)
    end
end
