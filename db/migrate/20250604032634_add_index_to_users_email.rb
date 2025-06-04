class AddIndexToUsersEmail < ActiveRecord::Migration[7.1]
  def up
    # First, remove duplicate emails by keeping only the first occurrence
    User.select(:email).group(:email).having('count(*) > 1').each do |user|
      duplicates = User.where(email: user.email).order(created_at: :asc)
      # Skip the first record (keep it) and delete the rest
      duplicates.offset(1).destroy_all
    end

    # Now we can safely add the unique index
    add_index :users, :email, unique: true
  end

  def down
    remove_index :users, :email
  end
end
