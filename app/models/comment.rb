class Comment < ApplicationRecord
  
  # Includes
  
  # Attributes
  
  # Associations
  belongs_to :user
  belongs_to :blog
  
  # Delegates
  
  # Constants
  
  # Scopes
  
  # Callbacks
  
  # Validations
  validates :content, presence: true, length: { minimum: 5, maximun: 1000 }
  # Constants Methods
  
  # Class methods
  
  # Instance Public methods
  
  private
  
  # Callbacks
  
  # Validations
  
  # Instance Private methods
  
end
