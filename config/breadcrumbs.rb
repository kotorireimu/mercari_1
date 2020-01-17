crumb :root do
  link "Fmarket", root_path
end

crumb :homes do
  link "マイページ", homes_path
  parent :root
end

crumb :profile do
  link "プロフィール", prof_homes_path
  parent :homes
end

crumb :identification do
  link "本人情報の登録", identification_homes_path
  parent :homes
end

crumb :logout do
  link "ログアウト",  destroy_user_session_path
  parent :homes
end

crumb :card do
  link "支払い方法", card_homes_path
  parent :homes
end

crumb :exhibition do
  link "出品した商品-出品中", exhibition_homes_path
  parent :homes
end