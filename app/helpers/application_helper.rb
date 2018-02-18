module ApplicationHelper
	def bootstrap_class_for flash_type
		{ success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
	end

	def flash_messages(opts = {})
		flash.each do |msg_type, message|
			#concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in", style:"position: absolute; top: 40px; width: 100%; z-index: 1000; right: 0;") do
			concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in", style:"top: 40px; width: 100%; z-index: 1000; right: 0;") do
				concat content_tag(:button, '×', class: "close", data: { dismiss: 'alert' })
				if message.kind_of?(Array) and !message[0].nil?
					concat ("-"+message[0].join("<br />-")).html_safe
				else
					concat message
				end
			end)
		end
		nil
	end
	def selected_link cur_path
		"active" if (controller_name + '/' + action_name) == cur_path
	end
end
