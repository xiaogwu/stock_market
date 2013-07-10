class QuotesController < ApplicationController

  def quote
    @symbol = params[:symbol].upcase
    if @symbol.empty?
      flash[:error] = "Symbol can't be blank.  Please try again."
      # redirect_to '/'
      render :home
    else
      @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)
      if @quote[@symbol].lastTrade == 0
        flash[:error] = "Invalid symbol.  Please try again."
        # redirect_to '/'
        render :home
      end
    end
  end

end