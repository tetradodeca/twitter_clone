class CreateStatus < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.references :user, foreign_key: true
      t.references :follower, foreign_key: true
    end
  end
end
