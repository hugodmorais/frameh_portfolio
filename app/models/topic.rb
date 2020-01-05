class Topic < ApplicationRecord
    # Includes
    
    # Attributes
    
    # Associations
    has_many :blogs
    
    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks
    
    # Validations
    validates :title, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    def self.with_blogs
        includes(:blogs).where.not(blogs: { id: nil })
    end
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
