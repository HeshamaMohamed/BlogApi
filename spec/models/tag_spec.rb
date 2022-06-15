require 'spec_helper'

RSpec.describe Tag, type: :model do
  # ActiveRecord
  it { should have_db_column(:name) }

  # ActiveModel matchers
  it { should validate_presence_of(:name) }

  it { should have_and_belong_to_many(:posts) }
end
