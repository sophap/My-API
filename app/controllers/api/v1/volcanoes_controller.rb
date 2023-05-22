class Api::V1::VolcanoesController < ApplicationController
  before_action :authenticate_user, only: [:create, :show, :update, :destroy]

    def index

        # Use Redis to cache the results of the query for 5 minutes
        @volcanoes = Rails.cache.fetch('volcanoes', expires_in: 5.seconds) do
          Volcano.paginate(page: params[:page], per_page: 20)
        end
        render json: @volcanoes
    end


    def show
        # Use Redis to cache the result of the query for 1 minute
        @volcano = Rails.cache.fetch("volcano_#{params[:id]}", expires_in: 1.minute) do
          Volcano.find(params[:id])
        end
        render json: @volcano
      end
    
      def create
        @volcano = Volcano.new(volcano_params)
        if @volcano.save
          # Clear the cache when a new volcano is created
          Rails.cache.delete('volcanoes')
          render json: @volcano, status: :created
        else
          render json: @volcano.errors, status: :unprocessable_entity
        end
      end
    
      def update
        @volcano = Volcano.find(params[:id])
        if @volcano.update(volcano_params)
          # Clear the cache when a volcano is updated
          Rails.cache.delete("volcano_#{params[:id]}")
          Rails.cache.delete('volcanoes')
          render json: @volcano, status: :ok
        else
          render json: @volcano.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @volcano = Volcano.find(params[:id])
        @volcano.destroy
        # Clear the cache when a volcano is destroyed
        Rails.cache.delete("volcano_#{params[:id]}")
        Rails.cache.delete('volcanoes')
        head :no_content
      end
    
      private
    
      def volcano_params
        params.require(:volcano).permit(:volcano_id, :volcano_name, :country, :region, :subregion, :latitude, :longitude, :pei, :h_active, :vei_holoce, :hazard, :classification, :risk)
      end
    
      def authenticate_user
        unless current_user
          render json: { error: "You must be logged in to perform this action" }, status: 401
        end
      end
end
