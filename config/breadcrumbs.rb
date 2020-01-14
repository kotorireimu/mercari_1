crumb :root do
  link "Fmarket", root_path
end

crumb :homes do
  link "マイページ", homes_path
  parent :root
end

crumb :profile do
  link "プロフィール", homes_edit_path
  parent :homes
end

crumb :identification do
  link "本人情報の登録", homes_identification_path
  parent :homes
end

crumb :logout do
  link "ログアウト",  destroy_user_session_path
  parent :homes
end

