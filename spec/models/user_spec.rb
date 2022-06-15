require 'spec_helper'

describe User do
  # ActiveRecord matchers
  it { should have_db_column(:name) }
  it { should have_db_column(:email) }
  it { should have_db_column(:image) }
  it { should have_db_index(:email) }

  # ActiveModel matchers
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(6).is_at_most(32) }
  it { should allow_values('first name').for(:name) }

  it { should validate_presence_of(:email) }
  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }

  it 'is database authenticable' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end
end
