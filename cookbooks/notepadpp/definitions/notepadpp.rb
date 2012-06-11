define :notepadpp, :action => :install do

	#Validate action
	options = [:install, :uninstall]
	if !options.include?(params[:action]) 
		raise Chef::Exceptions::ValidationFailed, "Option :action must be equal to one of: #{options.join(", ")}!  You passed #{params[:action].inspect}."
	end
	
	#Install
  if params[:action] == :install 
		directory node["notepadpp"]["home"]

		cookbook_file "#{node["notepadpp"]["home"]}/install.exe" do
			source "npp.6.1.3.Installer.exe"
		end
		
		execute "Install Notepad++" do 
			command "installer.exe /S"
			cwd node["notepadpp"]["home"]
			action :run
			not_if {isInstalled()}
		end
  end
	
	#Uninstall
  if params[:action] == :uninstall 
		execute "Uninstall Notepad++" do 
			command "uninstall.exe /S"
			cwd node["notepadpp"]["home"]
			action :run
			only_if {isInstalled()}
		end
  end

end