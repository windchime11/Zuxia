module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => "btn")
  end

  # :f => f , not builder
  # partials are singularized here, requiring naming convention such as _xyz_fields.
  def link_to_add_fields_to_table(name, f, association, table_id)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association,new_object, :child_index => "new_#{association}") do |builder|
      render("reports/"+association.to_s.singularize + "_fields", :f => f)
    end
    link_to_function(name, "add_fields_to_table(this, \"#{association}\", \"#{escape_javascript(fields)}\", \"#{table_id}\")",
     :class => "btn")
  end


end
