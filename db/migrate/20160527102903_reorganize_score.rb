class ReorganizeScore < ActiveRecord::Migration
  def change
    remove_column :scores, :score_num, :integer
    remove_column :scores, :score_txtm, :string
    remove_column :scores, :score_comments, :text
    remove_column :scores, :score, :float
    add_column :scores, :score_1, :integer
    add_column :scores, :score_2, :integer
    add_column :scores, :score_3, :integer
    add_column :scores, :score_4, :integer
    add_column :scores, :score_5, :integer
    add_column :scores, :score_6, :integer
    add_column :scores, :score_7, :integer
    add_column :scores, :score_8, :integer
    add_column :scores, :score_9, :integer
    add_column :scores, :score_total, :integer
  end
end
