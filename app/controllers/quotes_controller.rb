class QuotesController < ApplicationController

  def quote
    @symbol = params[:symbol].upcase
    @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)
  end

end