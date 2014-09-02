class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  scope :published, -> { where(published: true) }
  scope :by, ->(user) { where(user_id: user.id) }

  def content_html
    return "" if content.blank?

    data = JSON.parse(content)['data']
    html = ""
    data.each do |element|
      if element["type"] == "text"
        html += element["data"]["text"]

      elsif element["type"] == "heading"
        html += "<h2>#{element["data"]["text"]}</h2>"

      elsif element["type"] == "quote"
        html += "<blockquote><p>#{element["data"]["text"]}</p><footer>- <cite>#{element["data"]["cite"]}</cite></blockquote>"


      elsif element ["type"] == "list"
        html += "<ul><li>#{element["data"]["text"]}</li></ul>"

      elsif element ["type"] == 'image'
        html += "<img src=#{element["data"]["file"]["url"]}>"


      elsif element ["type"] == "video"
        if element ["data"]["source"] == 'vimeo'
          html += "<iframe src='//player.vimeo.com/video/#{element["data"]["remote_id"]}' width='500' height='281' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>"
        elsif element["data"]["source"] == 'youtube'
          html += "<iframe width='420' height='315' src='//www.youtube.com/embed/#{element['data']['remote_id']}' frameborder='0' allowfullscreen></iframe>"
        end
      end

    end
    html.html_safe
  end

  def published?
    self.published == true
  end
end

