# issueの関数を上書きして、
# today_due_date関数を追加、css_classesを更新する。
require_dependency 'issue'

module IssuePatch
  def self.included(base)
    # 定義したInstanceMethodsを読み込ませる
    base.send(:include, InstanceMethods)
    
    # css_classesの名前を切り替え
    base.class_eval do
      alias_method_chain :css_classes, :due_date
    end
  end

  module InstanceMethods
    # 新規関数 today_due_date追加
    # 今日が期日の場合trueを返す
    def today_due_date?
      v1 = !due_date.nil?
      v2 = due_date == Date.today
      v3 = !status.is_closed?
      v  = v1 && v2 && v3
      Rails.logger.debug "[due_date]" + id.to_s + ":" + subject + ":" + due_date.to_s + ":" + v1.to_s + "," + v2.to_s + "," + v3.to_s + "," + v.to_s
      !due_date.nil? && (due_date == Date.today) && !status.is_closed?
    end
    
    # 既存関数css_classesを上書き
    def css_classes_with_due_date
      s = css_classes_without_due_date
      s << ' due_date' if today_due_date?
      return s
    end
  end
end

# Issue本体に、作成したIssuePatch.includeを実行させる
Issue.send(:include, IssuePatch)
