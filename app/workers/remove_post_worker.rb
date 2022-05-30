class RemovePostWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    post = Post.find(id)
    post&.destroy
  end
end
