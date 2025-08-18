class Convert::Import
  attr_accessor :users, :articles, :sessions
  def initialize
    puts "Hello Import"
    import_users
    import_articles
    # import_sessions
  end

  def import_users
    json = File.read(Rails.root.join("app", "objects", "json", "users.json"))
    records = JSON.parse(json)
    # puts records[0]
    # return
    records.each do |rec|
      model = User.new(rec)
      unless model.valid?
        puts "New model: #{model.id},is invalid:"
        puts model.errors.objects.first.full_message
      else
        model.save
      end
    end
    puts "Users imported or created"
    # ActiveRecord::Base.connection.reset_pk_sequence!('users')
  end

  def import_articles
    json = File.read(Rails.root.join("app", "objects", "json", "articles.json"))
    records = JSON.parse(json)
    # puts records[0]
    # return
    records.each do |rec|
      model = Article.new(rec)
      unless model.valid?
        puts "New model: #{model.id},is invalid:"
        puts model.errors.objects.first.full_message
      else
        model.save
      end
    end
    puts "Articles imported or created"
    # ActiveRecord::Base.connection.reset_pk_sequence!('articles')
  end

  def import_sessions
    json = File.read(Rails.root.join("app", "objects", "json", "sessions.json"))
    records = JSON.parse(json)
    # puts records[0]
    # return
    records.each do |rec|
      model = Session.new(rec)
      unless model.valid?
        puts "New model: #{model.id},is invalid:"
        puts model.errors.objects.first.full_message
      else
        model.save
      end
    end
    puts "Sessions imported or created"
    # ActiveRecord::Base.connection.reset_pk_sequence!('sessions')
  end
end
