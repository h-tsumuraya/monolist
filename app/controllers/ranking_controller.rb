class RankingController < ApplicationController
  def have
    @items = []

    # item_idでグループ化し、重複数の降順で並び替えて、keyを取得
    ids = Hash[Have.group(:item_id).count.sort_by { |_, v| -v }].each do |key, value|
      # selectを何回も読んでしまっている
      @items.push Item.find(key)

      # 10位まで
      if @items.size >= 10
        break
      end
    end
  end

  def want
    @items = []
    ids = Hash[Want.group(:item_id).count.sort_by { |_, v| -v }].each do |key, value|
      @items.push Item.find(key)
      if @items.size >= 10
        break
      end
    end

  end
end
