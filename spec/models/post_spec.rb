require 'spec_helper'

RSpec.describe Post, type: :model do
  # ActiveRecord
  it { should have_db_column(:title) }
  it { should have_db_column(:body) }
  it { should have_db_column(:user_id) }
  it { should have_db_index(:user_id) }

  # ActiveModel matchers
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:tags) }
  it { should validate_presence_of(:user) }

  it { should belong_to(:user) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_and_belong_to_many(:tags) }

  it { is_expected.to callback(:delete_after_24hours).after(:create) }
end
