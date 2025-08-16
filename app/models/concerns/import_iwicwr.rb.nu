class ImportIwicwr
  def initialize()
    articles = JSON.parse(Rails.root.join('lib','articles.json').read)
    puts "There are #{articles.size} Articles"
    articles.each do |a|
      import(a)
    end
  end

  def import(article)
    a = Article.new
    a.user_id = 1
    a.date = article['created_at'].to_date
    a.title = article['title']
    a.category = article['category']
    a.content = article['content']
    a.author = "Steve Alex" #article['author']
    puts "Title: #{a.title} Date: #{a.date}"
    a.save
  end



  # t.string "title"
  # t.string "category"
  # t.text "content"
  # t.datetime "created_at", null: false

  # t.date "date"
  # t.string "title"
  # t.string "author"
  # t.text "content"
  # t.string "category"
  # t.integer "user_id"
  # t.datetime "created_at", null: false


end


