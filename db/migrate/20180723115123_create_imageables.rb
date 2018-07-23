class CreateImageables < ActiveRecord::Migration[5.2]
  def change
    create_table :imageables do |t|
      t.references :block, polymorphic: true
      t.references :property, polymorphic: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
