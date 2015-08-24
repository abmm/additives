class Api::V1::AdditivesController < Api::ApplicationController
  before_action :set_additive, only: [:update]
  before_action :get_user

  def index
    @additives = Rails.cache.fetch("additives#index", :expires_in => 1.day) do
      Additive.all.includes(:classification).includes(:origin)
    end
    render jbuilder: @additives , :locals => { :encrypted => params[:fistro] }
  end

  # POST /api/v1/additives
  def create
    @additive                  = Additive.new(additive_params)
    if @additive.save
      render json: @additive
    else
      render json: @additive.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/additives/1
  #It is only allowed to update :quantity and :description.
  def update
      if @additive.update(params.permit(:quantity, :description))
        render json: @additive 
      else
				render json: @additive.errors, status: :unprocessable_entity
      end
  end

  private

  	def get_user
  		@user = User.find_by(api_token: session[:token])
  	end

    # Use callbacks to share common setup or constraints between actions.
    def set_additive
      @additive = Additive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additive_params
    	params.permit(:contact_id, :type, :quantity, :description)
    end


end
