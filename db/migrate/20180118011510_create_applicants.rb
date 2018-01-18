class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :workflow_state
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
