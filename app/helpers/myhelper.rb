def show_svg(path)
  File.open(asset_path("images/loading.svg"), "rb") do |file|
    raw file.read
  end
end
