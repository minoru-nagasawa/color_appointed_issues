# 全ページにstylesheet(color_due_date_issues.css)を読み込ませる
# http://www.redmine.org/boards/2/topics/14277?r=14311
module ColorDueDateIssue
  class Hooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context={})
      stylesheet_link_tag 'color_due_date_issues.css', :plugin => 'redmine_color_due_date_issues'
    end
  end
end
