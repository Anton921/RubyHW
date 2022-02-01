class CreatAuthorCommentVote < ActiveRecord::Migration[6.1]
  def change
    create_table :authorcommentvotes do |t|
      t.integer :status
      t.references :author, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
