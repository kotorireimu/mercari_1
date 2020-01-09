crumb :root do
  link "fmarket", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end
