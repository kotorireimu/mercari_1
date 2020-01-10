crumb :root do
  link "fmarket", root_path
end

crumb :homes do
  link "マイページ", homes_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_homes_path
  parent :homes
end

crumb :identification do
  link "本人情報の登録", identification_homes_path
  parent :homes
end

crumb :logout do
  link "ログアウト", logout_homes_path
  parent :homes
end