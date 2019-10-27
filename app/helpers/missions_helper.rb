module MissionsHelper
  def priority_selection
    [["緊急", 'urgent'], ["普通", "common"], ["沒很重要", "low"]]
  end

  def category_selection
    [["公事", "company"], ["家事", "home"]]
  end
end
