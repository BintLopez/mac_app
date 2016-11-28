class CreateServicesRendereds < ActiveRecord::Migration
  def change
    create_table :services_rendereds do |t|
      t.belongs_to :service, index: true
      t.belongs_to :support_request, index: true

      t.timestamps null: false
    end
  end
end
