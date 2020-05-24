json.extract! post, :id, :title, :posttime, :starttime, :endtime, :postid, :userid, :category, :created_at, :updated_at, :image
json.url post_url(post, format: :json)
