module ApplicationHelper
  def cache_key_for(name, klass)
    table_name = klass.to_s.pluralize.downcase
    [table_name, name, klass.maximum(:updated_at), klass.count].join("-")
  end
end
