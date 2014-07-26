module ApplicationHelper
  def comment_url(comment)
    data = comment.data
    pid = @post.pid.partition('_').last
    cid = comment.data['id'].partition('_').last.to_s
    offset = data["message_tags"].first["offset"].to_s unless data["message_tags"].nil?
    url = 'https://www.facebook.com/'+@page.pid+"/posts/"+pid
    url = url + "?comment_id=" + cid + "&offset=" + offset.to_s
  end
end
