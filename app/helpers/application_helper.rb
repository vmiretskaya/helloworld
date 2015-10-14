module ApplicationHelper

def block_ex(&block)
		block_content = capture(&block)
		content = content_tag(:div, block_content, :class => :super_div)
    	#content = content_tag(:div, :class => :super_div) do
    	#	content_tag(:div, block_content, :class => :confedential_notice_content)  
     	#end	
	   content.concat(block.binding)
	end

			

end
