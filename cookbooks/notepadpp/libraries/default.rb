def isInstalled()
		::File.exists?("#{node["notepadpp"]["home"]}/notepad++.exe")
end