class RailsMapsCreatePosition<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
      # RailsMaps Position Attributes
      t.string :lat
      t.string :lon

      # Custom attributes
      <% attributes.each do |attribute| %>
      t.<%= attribute.type %> :<%= attribute.name %>
      <% end -%>

      t.timestamps
    end
  end
end
