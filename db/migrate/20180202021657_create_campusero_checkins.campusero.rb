# This migration comes from campusero (originally 20180202021144)
class CreateCampuseroCheckins < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')
    create_table :campusero_checkins, id: :uuid  do |t|
      t.string :slug
      t.string :username

      t.timestamps
    end
  end
end
