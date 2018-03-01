class Account < ApplicationRecord

  has_many :employees, dependent: :destroy
  has_many :customers, dependent: :destroy

  before_save :ensure_slug

  validates_uniqueness_of :slug

  private

  def ensure_slug
    unless slug.present?
      self.slug = name.truncate(50).parameterize
    end
  end

end
