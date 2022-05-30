class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tags

  validates :title, :body, :author, presence: true

  after_create :delete_after_24hours

  private

  def delete_after_24hours
    RemovePostWorker.perform_in(1440.minutes, id)
  end
end
