class Skill < ApplicationRecord
    # Includes
    includes Placeholder

    # Attributes
    
    # Associations
    
    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks
    after_initialize :set_defaults

    # Validations
    validates :title, :percente_utilized, presence: true
    
    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    def set_defaults
        self.badge ||= Placeholder.image_generator(height: '251', width: '252')
    end

    # Callbacks
    
    # Validations
    
    # Instance Private methods
end
