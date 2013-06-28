class CreatePageElements < ActiveRecord::Migration
  def change
    create_table :page_elements do |t|
      t.references :landing_page
      t.string :label
      t.text :value

      t.timestamps
    end
    add_index :page_elements, :landing_page_id
  end
end
