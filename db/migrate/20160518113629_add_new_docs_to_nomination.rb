class AddNewDocsToNomination < ActiveRecord::Migration
  def change
    add_column :nominations, :submission_word_document, :string
    add_column :nominations, :submission_pdf, :string
    rename_column :nominations, :photo_a, :nominee_organization_logo
  end
end
