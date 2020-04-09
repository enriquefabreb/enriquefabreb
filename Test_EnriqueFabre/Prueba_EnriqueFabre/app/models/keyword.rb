class Keyword < ApplicationRecord
  belongs_to :category
  def self.search(term)
    where('LOWER(description) LIKE :term', term: "%#{term.downcase}%")
  end
end
