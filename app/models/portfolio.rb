class Portfolio < ApplicationRecord
    # Includes
    includes Placeholder
    # Attributes
    
    # Associations
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                  reject_if: lambda { |attrs| attrs['name'].blank? }

    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks
    after_initialize :set_defaults

    # Validations
    validates :title, :body, :main_image, :thumb_image, presence: true
    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    # Constants Methods
    
    # Class methods

    def self.by_position
        order("position ASC")
    end
    
    # Instance Public methods

    private
    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '600', width: '400')
    end
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
