module VagonsHelper
  def sti_vagon_path(type = "vagon", vagon = nil, action = nil)
    send "#{format_sti(action, type, vagon)}_path", vagon
  end

  def format_sti(action, type, vagon)
    action || vagon ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
