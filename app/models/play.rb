# == Schema Information
#
# Table name: plays
#
#  id         :integer          not null, primary key
#  title      :string
#  game       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Play < ApplicationRecord
  has_one_attached :clip
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :title, presence: true, length: {minimum: 4, maximum: 15}
  validate :correct_video_type


  def play_path
    ActiveStorage::Blob.service.path_for(clip.key)
  end

  def self.recent_plays
    Play.where("created_at > ?", 7.days.ago)
  end

  def is_new?
    self.created_at > 2.days.ago
  end

  private

  def correct_video_type
    if !clip.attached?
      clip.purge
      errors.add(:clip, 'required.')
    elsif !clip.content_type.in?(%w(video/mp4)) #Maybe add more extensions later
      clip.purge
      errors.add(:clip, 'must be MP4.')
    elsif clip.byte_size > 20971520
      clip.purge
      errors.add(:clip, 'is too large.')
    end
  end
end
