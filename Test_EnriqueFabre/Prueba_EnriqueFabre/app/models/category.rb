class Category < ApplicationRecord
  has_many :keywords, dependent: :destroy
  validates :name, presence: true
  validates_associated :keywords
  def new_keyword_attributes=(keyword_attributes)
      keyword_attributes.each do |attributes|
      keywords.build(attributes)
      end
  end

  after_update :save_keywords
  def existing_keyword_attributes=(keyword_attributes)
    keywords.reject(&:new_record?).each do |keyword|
      attributes = keyword_attributes[keyword.id.to_s]
      if attributes
        keyword.attributes = attributes
      else
        keywords.delete(keyword)
      end
    end
  end

  def save_keywords
    keywords.each do |keyword|
      keyword.save(:validate => false)
    end
  end


end
