class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :user_token
      t.string :country_citizen
      t.string :country_destination
      t.timestamps
    end
  end
end
