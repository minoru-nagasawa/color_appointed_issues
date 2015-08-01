# Issueクラスを更新するファイルを認識させるため、
# lib下の*.rbをrequire_dependencyで指定している
require_dependency 'color_due_date_issues/issue_patch'
require_dependency 'color_due_date_issues/hooks'

Redmine::Plugin.register :redmine_color_due_date_issues do
  name 'Color due date issues plugin'
  author 'Minoru Nagasawa'
  author_url 'https://github.com/minoru-nagasawa'
  description '当日が期日のチケットを緑色に塗ります'
  url 'https://github.com/minoru-nagasawa/redmine_color_due_date_issues'
  version '1.0.0'
end
