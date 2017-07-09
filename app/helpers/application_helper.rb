module ApplicationHelper
	def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}?s=#{opts.delete(:size) { 100 }}", opts
  end

	def clean_hash(set)
		return unless set
		set.delete "created_at"
		set.delete "updated_at"
		set.delete "encrypted_password"
		set.delete "reset_password_token"
		set.delete "reset_password_sent_at"
		set.delete "remember_created_at"
		# set.delete "sign_in_count"
		set.delete "current_sign_in_at"
		set.delete "current_sign_in_ip"
		# set.delete "last_sign_in_ip"
		# set.delete "last_sign_in_at"
		set.delete "deleted_at"
		set.delete "picture_updated_at"
		set.delete "picture_file_name"
		set.delete "picture_file_size"
		set.delete "picture_content_type"
		set.delete "file_updated_at"
		set.delete "file_file_name"
		set.delete "file_file_size"
		set.delete "file_content_type"
	end

	def changeset_to_pretty_hash(changeset, item_type)
		result_hash = {}
		set = changeset
		set = {} unless set
		clean_hash(set)
		set.each do |k, v|
			name = k
			if name.end_with? "_id"
				name = name[0..(name.size - 4)]
				entity = eval(name.classify).where(id: v[1]).first
				entity = "id: #{v}" unless entity
				value = entity.to_s
			else
				value = v[1]
			end
			t_name = t("activerecord.attributes.#{item_type.underscore}.#{name}")
			name = t_name unless t_name.start_with? "<span"
			result_hash[name] = value
		end
		result_hash
	end

	def object_to_pretty_hash(object)
		return {} unless object
		set = object.attributes

		return if set == nil

		result_hash = {}
		clean_hash(set)
		set.each do |k, v|
			next if v.blank?
			name = k
			if name.end_with? "_id"
				name = name[0..(name.size - 4)]
				entity = eval(name.classify).where(id: v).first
				entity = "id: #{v}" unless entity
				value = entity.to_s
			else
				value = v
			end
			t_name = t("activerecord.attributes.#{object.class.name.underscore}.#{name}")
			name = t_name unless t_name.start_with? "<span"
			result_hash[name] = value
		end
		result_hash
	end

	def pretty_hash_to_dl(hash)
		dl_string = "<dl class='dl-horizontal'>"
		hash.each do |k, v|
			dl_string += "<dt>#{k}:</dt><dd>#{v}</dd>"
		end
		dl_string += "</dl>"
	end
end
