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
    # item_idでグループ化し、重複数の降順で並び替えて、keyを取得
    ids = Hash[clazz.group(:item_id).count.sort_by { |_, v| -v }].each do |key, value|
      # selectを何回も読んでしまっている
      item = Item.find(key)
      item.rank = value
      @items.push item

      # 10位まで
      if @items.size >= 10
        break
      end

    end
  end

end
