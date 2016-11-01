class CreateServicesRendereds < ActiveRecord::Migration
  def change
    create_table :services_rendereds do |t|
      t.integer :service_id
      t.integer :support_request_id

      t.timestamps null: false
    end
  end
end
