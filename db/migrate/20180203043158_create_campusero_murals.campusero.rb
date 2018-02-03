# This migration comes from campusero (originally 20180203042446)
class CreateCampuseroMurals < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')
    create_table :campusero_murals, id: :uuid  do |t|
      t.string :username
      t.text :description

      t.timestamps
    end
  end
end
