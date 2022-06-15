require 'spec_helper'

RSpec.describe Comment, type: :model do
  # ActiveRecord
  it { should have_db_column(:body) }
  it { should have_db_column(:post_id) }
  it { should have_db_column(:user_id) }
  it { should have_db_index(:post_id) }
  it { should have_db_index(:user_id) }

  # ActiveModel matchers
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }
  it { should belong_to(:post) }
end
