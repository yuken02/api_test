## タブ
@tab_new = Tab.new
@tabs = Tab.where(user_id: current_user.id)
@tabs_count = @tabs.count
# activerecord_relationを配列に変換
@tabs_h = @tabs.pluck(:name, :id)

## 登録ワード
@word_new = Keyword.new
@word_count = 0
if Keyword.exists?(tab_id: [@tabs.first])
  @word = Keyword.where(tab_id: [
    @tabs.each do |t|
      t.id
    end
  ])
end


##タブ
@tab_new = Tab.new
@tabs = Tab.where(user_id: current_user.id)

## 登録ワード
@word_new = Keyword.new
if Keyword.exists?(tab_id: [@tabs.first])
  @word = Keyword.where(tab_id: @tabs.ids)
end

#plack は collection_selectを使うことで省略可能