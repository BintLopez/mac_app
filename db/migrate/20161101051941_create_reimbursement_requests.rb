class CreateReimbursementRequests < ActiveRecord::Migration
  def change
    create_table :reimbursement_requests do |t|
      t.integer :support_request_id
      t.integer :assigned_to
      t.integer :requested_by
      t.string :status
      t.string :receipt_upload
      t.integer :amount_cents
      t.string :reason

      t.timestamps null: false
    end
  end
end
