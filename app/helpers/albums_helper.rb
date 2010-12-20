module AlbumsHelper
  def list_content(collection, pluralized_class)
    unless collection.blank?              
      html = content_tag :strong, "#{collection.count} #{pluralized_class}" 
      collection.each do |object|
         html << content_tag(:p, link_to(object.name, [object.user, object])) 
      end
      html 
    end 
  end
  
  def show_adv_features(data_array, feature_name)
    html = ""
    unless data_array.blank?
      html << "<form action='#{remove_data_user_album_url(@album.user, @album)}' method=post>"  
      html << "<table>"
      html << "<tr>"
      html << "<td><b>#{data_array.count} #{feature_name}<b></td>"
      html << "<td>(Check to Delete)</td>"
      
      if feature_name == 'Old Images'
        "<td>(Check to disable)</td>"
      end
      html << "</tr>"
           
      data_array.each do | element |
         
      	case feature_name 
      	  when 'Images'
      	    html << "<tr class=\"album_image\">"
            html << content_tag(:td, check_box_tag("image_ids[]", element.id))
            html << content_tag(:td, element.name) 
      	  when 'Musics'
      	    html << "<tr class=\"album_music\">"
            html << content_tag(:td, check_box_tag("music_ids[]", element.id))
            html << content_tag(:td, element.name)
      	  when 'Videos'
      	  	html << "<tr class=\"album_video\">"		
            html << content_tag(:td, check_box_tag("video_ids[]", element.id))
            html << content_tag(:td, element.name)  
          when 'Documents'
      	  	html << "<tr class=\"album_document\">"		
            html << content_tag(:td, check_box_tag("document_ids[]", element.id))
            html << content_tag(:td, element.name)   
        end  
        
        html << "</tr>"                  
      end
                  
      html << "</table>"
      html << submit_tag('Remove')
      html << "</form>"    
    end
    
    html
  end
end
