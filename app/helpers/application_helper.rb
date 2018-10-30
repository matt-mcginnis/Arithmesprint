module ApplicationHelper
    def user_avatar_helper(user, size, style_class, style = "none")
        if user.avatar.blank?
            image_tag "Default-Avatar", size: size, class: style_class, style: style
        else
            image_tag user.avatar.url, size: size, class: style_class, style: style
        end
    end
end
