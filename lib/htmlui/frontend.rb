require_relative 'backend'

class HTMLUI
	def initialize
		if $htmlui_qmlcontroller_instance then
			raise 'There can be only one instance of HTMLUI class.'
		end
	end
	
	def render(file)
		if not File.exists? file then
			raise "#{file} - no such file or directory."
		end
		$htmlui_qmlcontroller_ui = File.read(file)
		if not $htmlui_qmlcontroller_instance then
			start_htmlui_browser
		else
			$htmlui_qmlcontroller_instance.render
		end
	end
	
	def _prerender_ex
		if not $htmlui_qmlcontroller_instance then
			raise "Cannot run this method without running render(file) first."
		end
	end
	
	def [](id)
		_prerender_ex()
		if not String === id then
			raise "#{id} is not a String"
		end
		return $htmlui_qmlcontroller_instance.valueof(id)
	end
end