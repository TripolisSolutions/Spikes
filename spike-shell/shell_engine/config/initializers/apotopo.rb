Rails.application.config.after_initialize do
  #Apotomo::Widget.append_view_path Rails.root + 'app/widgets'
  Apotomo::Widget.append_view_path ShellEngine::Engine.root + 'app/widgets'
end