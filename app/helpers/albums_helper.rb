module AlbumsHelper
  def list_content(collection, pluralized_class)
    unless collection.blank?              
      html = content_tag :strong, "#{collection.count} #{pluralized_class}" 
      collection.each do |object|
         html << content_tag(:p, link_to(object.name, object)) 
      end
      html 
    end 
  end
end
