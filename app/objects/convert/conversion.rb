# module Convert
# this is run in ptgolf7 directory
# this should be done by importing ptgolf7 db to development
# then running conversion from development
# db drop development

class Convert::Conversion
  attr_accessor :json, :hash
  def initialize
    puts "Hello Conversion"
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end

    # @json =  User.all.order(:id).as_json(except: [:permits])
    # File.write(Rails.root.join('app','objects','json','users.json'),@json.to_json)
    # @json =  Article.all.order(:id).as_json
    # File.write(Rails.root.join('app','objects','json','articles.json'),@json.to_json)
    # @json =  Session.all.order(:id).as_json
    # File.write(Rails.root.join('app','objects','json','sessions.json'),@json.to_json)
  end
end

# end
