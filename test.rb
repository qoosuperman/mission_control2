h={"0"=>{"name"=>"aaa"}, "1"=>{"name"=>"sss"}, "2"=>{"name"=>"ddd"}, "3"=>{"name"=>""}, "4"=>{"name"=>""}}
h.reduce({}) do |rs, tag|
  
  # rs.merge(tag[0] => tag[1])
  p rs
  p tag
  rs.merge(tag.first => tag.last)
end
puts q

# mission_params[:tags_attributes].reduce({}) { |rs, tag| rs.merge(tag.first => tag.last) }
# (byebug) mission_params[:tags_attributes].to_h.reduce({}) { |rs, tag| rs.merge(tag.first => tag.last.merge('id' => 123)) }
# {"0"=>{"name"=>"aaa", "id"=>123}, "1"=>{"name"=>"vvv", "id"=>123}, "2"=>{"name"=>"bbb", "id"=>123}, "3"=>{"name"=>"", "id"=>123}, "4"=>{"name"=>"", "id"=>123}}