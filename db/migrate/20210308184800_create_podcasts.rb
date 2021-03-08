class CreatePodcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :description
      t.string :length
      t.belongs_to :mood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
