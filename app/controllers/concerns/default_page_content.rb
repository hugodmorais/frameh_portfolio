module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "FramehPortfolio"
        @seo_keywords = "Hugo Morais Portfolio"
    end
end