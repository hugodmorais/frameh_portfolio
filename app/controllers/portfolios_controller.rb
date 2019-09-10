class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

    def index
        @portfolio_items = Portfolio.all
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_item_params)
        if @portfolio_item.save
          flash[:success] = "Portfolio successfully created"
          redirect_to @portfolio_item
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def update
        respond_to do |format|
            if @portfolio_item.update(portfolio_item_params)
                format.html { redirect_to @portfolio_item, notice: 'Portfolio was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        @portfolio_item.destroy
        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Blog was successfully destroyed.' }
        end
    end

    private

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
  
    def portfolio_item_params
      params.require(:portfolio).permit!
    end    
end
