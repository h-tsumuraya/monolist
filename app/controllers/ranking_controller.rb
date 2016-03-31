class RankingController < ApplicationController
  def have
    get_items Have
  end

  def want
    get_items Want
  end

  private

  def get_items(clazz)
    @items = []

    clazz.group(:item).count.sort_by(&:last).reverse.each do |item, value|
      item.rank = value
      @items.push item

      # 10位まで
      if @items.size >= 10
        break
      end
    end

  end

end
