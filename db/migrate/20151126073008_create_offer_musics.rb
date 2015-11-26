class CreateOfferMusics < ActiveRecord::Migration
  def change
    create_table :offer_musics do |t|
      t.string :title
      t.string :singer
      t.string :offer_name
      t.string :memo
      t.integer :is_end, default: 0

      t.timestamps null: false
    end
  end
end
