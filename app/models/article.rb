class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  scope :published, -> { where(published: true) }
  scope :by, ->(user) { where(user_id: user.id) }

  def content_html
    data = JSON.parse(content)['data']
    html = ""
    data.each do |element|
      if element["type"] == "text"
        html += element["data"]["text"]
      elsif element["type"] == "heading"
        html += "<h2>#{element["data"]["text"]}</h2>"
      end
    end
    html.html_safe
  end
end
