ActiveAdmin.register SupersizedImage do
	permit_params :visible, :image
  index do
		column :visible
		column "Image" do |supersized_image|
			link_to(image_tag(supersized_image.image.url(:thumb), :height => '100'), admin_supersized_image_path(supersized_image))
		end
		default_actions 
	end

	show do |supersized_image|
		attributes_table do
			row :visible
			row :image do
		    image_tag(supersized_image.image.url(:thumb), :height => '100')
		  end
		end
		active_admin_comments
	end

	form do |f|
	  f.inputs "Homepage Image Details" do
	    f.input :visible
	    f.input :image
	  end
	  f.actions
	end

end
