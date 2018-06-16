class CreateGoogleCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :google_credentials do |t|
      t.string :uid
      t.string :token
      t.string :refresh_token
      t.string :expires_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
