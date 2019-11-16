class Portfolio < ApplicationRecord
    # Includes

    # Attributes
    
    # Associations
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                  allow_destroy: true,
                                  reject_if: lambda { |attrs| attrs['name'].blank? }

    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks

    # Validations
    validates :title, :body, presence: true
    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader

    # Constants Methods
    
    # Class methods

    def self.by_position
        order("position ASC")
    end
    
    # Instance Public methods

    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
