module MissionsHelper
  def priority_selection
    [[t("missions.urgent"), 'urgent'], [t("missions.common"), "common"], [t("missions.low"), "low"]]
  end

  def category_selection
    [[t("missions.public"), "company"], [t("missions.home"), "home"]]
  end
end

