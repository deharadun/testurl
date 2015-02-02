class CreateWurls < ActiveRecord::Migration
  def change
    create_table :wurls do |t|
      t.text :ourl
      t.string :turl

      t.timestamps
    end
  end
end
