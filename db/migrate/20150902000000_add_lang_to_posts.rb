class AddLangToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :lang, :string, :default => 'en'
  end
end
