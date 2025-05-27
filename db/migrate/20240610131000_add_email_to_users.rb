class AddEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    # Itt ne legyen még unique és null: false!
    # add_index :users, :email, unique: true  # ezt csak akkor add hozzá, ha minden rekordnak van egyedi emailje
  end
end
