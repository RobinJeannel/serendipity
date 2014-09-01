class CreateSirTrevorImageUploaders < ActiveRecord::Migration
  def change
    create_table :sir_trevor_image_uploaders do |t|

      t.timestamps
    end
  end
end
