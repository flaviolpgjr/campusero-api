# This migration comes from campusero (originally 20180202003234)
class CreateCampuseroEvaluations < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')
    create_table :campusero_evaluations, id: :uuid  do |t|
      t.string :slug
      t.decimal :note
      t.string :username

      t.timestamps
    end
  end
end
