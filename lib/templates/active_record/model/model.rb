<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %><%= ', required: true' if attribute.required? %>
<% end -%>
<% if attributes.any?(&:password_digest?) -%>
  has_secure_password
<% end -%>
  include PgSearch
  has_paper_trail

  def self.search(search, page)
    if search && search != ""
      paginate(:per_page => 20, :page => page).full_search(search)
    else
      paginate(:per_page => 20, :page => page)
    end
  end

  pg_search_scope :full_search,
    :against => [<%= (attributes.map { |a| ":#{a.name}"}).join(", ") %>],
    :using => {
      :tsearch => {:prefix => true},
      :dmetaphone => {},
      :trigram => {}
    },
    :ignoring => :accents
end
<% end -%>
