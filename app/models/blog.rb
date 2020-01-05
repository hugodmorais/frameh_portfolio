class Blog < ApplicationRecord
    # Includes
    extend FriendlyId
    friendly_id :title, use: :slugged

    # Attributes
    
    # Associations
    belongs_to :topic
    has_many :comments, dependent: :destroy

    # Delegates
    
    # Constants
    enum status: { draft: 0, published: 1 }

    # Scopes
    
    # Callbacks
    
    # Validations
    validates :title, :body, :topic_id, presence: true
    
    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
