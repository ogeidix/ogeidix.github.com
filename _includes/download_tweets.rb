require 'twitter'

def htmlify_tweet(tweet)
  text = tweet.text
  text = text.gsub(/\@\S+/){|t| "<a href='https://twitter.com/#{t}'>#{t}</a>"}
  text = text.gsub(/\#\S+/){|t| "<a href='https://twitter.com/search?q=#{t}'>#{t}</a>"}
  text = text.gsub(/http:\S+/){|t| "<a href='#{t}'>#{t}</a>"}
"
<div class='tweet'>
  <img class='avatar' src='#{tweet.user.profile_image_url}' />
  <span class='author'>#{tweet.user.name}</span>
  #{text}
  <a class='date' href='https://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}'>
    <nobr>
      &mdash; #{tweet.created_at.strftime('%d %b')}
    </nobr>
  </a>
</div>"
end

tweets = Twitter.user_timeline('ogeidix', :include_rts => true).first(12)
remove_reply = true

tweets.each do |tweet|
  unless (remove_reply &&  tweet.text[0] == '@')
    if tweet.retweeted_status
      puts htmlify_tweet(tweet.retweeted_status)
    else
      puts htmlify_tweet(tweet)
    end
  end
end