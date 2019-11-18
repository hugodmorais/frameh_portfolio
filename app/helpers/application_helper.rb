module ApplicationHelper
    def login_helper style = ''
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: style) + 
            ' '.html_safe +
            (link_to "Login", new_user_session_path, class: style)
        else
            link_to "Logout", destroy_user_session_path, class: style, method: :delete
        end
    end

    def source_helper(layout_name = '')
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
            content_tag(:p, greeting, class: "source greeting")
        end
    end

    def copyright_generator
        FramehViewTool::Renderer.copyright 'Hugo Morais', 'All rights reserved'
    end

    def nav_items
        [
            {
                url: root_path,
                title: 'Home'
            },
            {
                url: about_me_path,
                title: 'About Me'
            },
            {
                url: contact_path,
                title: 'Contact'
            },
            {
                url: blogs_path,
                title: 'Blog'
            },
            {
                url: portfolios_path,
                title: 'Portfolio'
            }
        ]
    end
    def nav_helper style, tag_type
        nav_links = ''

        nav_items.each do |item|
            nav_links << content_tag("#{tag_type}") do
                content_tag(:a, :href => "#{item[:url]}", class: "#{style} #{active? item[:url]}") do
                    "#{item[:title]}"
              end
            end
        end

        nav_links.html_safe
    end

    def active? path
        "active" if current_page? path
    end

    def alerts
        alert = (flash[:alert] || flash[:error] || flash[:notice])

        if alert
            alert_generator alert
        end
    end

    def alert_generator msg
        js add_gritter(msg, title: "Hugo Morais", sticky: false)
    end
end




# concat link_to("About Me", about_me_path, :class => "#{style}")
# concat link_to("Contact", contact_path, :class => "#{style}")
# concat link_to("Blog", blogs_path, :class => "#{style}")
# concat link_to("Portfolio", portfolios_path, :class => "#{style}")
