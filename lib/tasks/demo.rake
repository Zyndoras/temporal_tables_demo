task demo: :environment do
  ActiveRecord::Base.logger = Logger.new STDOUT

  puts 'POST 1:', post_of_comment.inspect # => Outputs the correct PostHistory
  puts 'POST 2:', post_of_comment.inspect # => Outputs nil
end

def post_of_comment
  post = Post.create
  comm = Comment.create(post: post)

  comm.history.at(Time.current).first.post
end
