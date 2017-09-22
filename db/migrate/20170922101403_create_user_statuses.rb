class CreateUserStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_statuses do |t|
    	t.references :leader
    	t.references :follower
    end
  end
end
