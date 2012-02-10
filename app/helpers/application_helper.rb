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

  #form_for @report do |f|
  #<p><%= link_to_add_fields_to_table "Add Reading", f, :book_readings,  @book_table_id %></p>
  def link_to_add_fields_to_table(name, f, association, table_id)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association,new_object, :child_index => "new_#{association}") do |builder|
      render("reports/"+association.to_s.singularize + "_fields", :f => f)
    end
    link_to_function(name, "add_fields_to_table(this, \"#{association}\", \"#{escape_javascript(fields)}\", \"#{table_id}\")",
     :class => "btn")
  end


end
