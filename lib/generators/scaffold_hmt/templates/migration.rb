# Automatically generated by Scaffold_htm Generator.
class Create<%= join_table_name %> < ActiveRecord::Migration
  def change
    create_table :<%= join_table_name %> do |t|
      t.integer :<%= first_name.underscore %>_id
      t.integer :<%= second_name.underscore %>_id
      t.timestamps
    end
  end
end
