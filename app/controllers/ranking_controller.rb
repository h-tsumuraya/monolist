class RankingController < ApplicationController
  def have
    get_items Have
  end

  def want
    get_items Want
  end

  private

  def get_items(clazz)
    @items = clazz.group(:item).count.sort_by(&:last).reverse.shift(10)
  end

end
