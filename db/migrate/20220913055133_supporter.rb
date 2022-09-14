class Supporter < ActiveRecord::Migration[5.2]
  def change
      create_table :supporters do |t|

        t.string :email
    end
  end
end
