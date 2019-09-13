class Blog < ApplicationRecord
    # Includes
    extend FriendlyId
    friendly_id :title, use: :slugged

    # Attributes
    
    # Associations
    
    # Delegates
    
    # Constants
    enum status: { draft: 0, published: 1 }

    # Scopes
    
    # Callbacks
    
    # Validations
    validates :title, :body, presence: true
    
    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
