class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, :body, :user, presence: true
  validates :tags, presence: true

  after_create :delete_after_24hours

  private

  def delete_after_24hours
    RemovePostWorker.perform_in(1440.minutes, id)
  end
end
