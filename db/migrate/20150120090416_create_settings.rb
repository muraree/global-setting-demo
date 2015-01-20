class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :email
      t.boolean :enable_notification

      t.timestamps
    end
  end
end
