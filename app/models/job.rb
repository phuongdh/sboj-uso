require 'rss'

rss = RSS::Parser.parse('https://www.jobsatosu.com/all_jobs.atom', false)

case rss.feed_type
  when 'rss'
    rss.items.each { |item| puts item.title }
  when 'atom'
    rss.items.each { |item| puts "#{item.title.content}\n #{item.author.name.content}\n #{item.content.content}" }
end
