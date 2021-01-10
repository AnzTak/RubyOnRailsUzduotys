class Lang
 	def self.get(txt, cookies)
 		file = File.read('app/models/interface.json')
		json = JSON.parse(file)
 		begin
 			if cookies['lang'] != nil
 				l = cookies['lang'].upcase()
 			else
 				l = 'EN'
 			end
			vlang = json['Translation']
			if vlang[txt][l] != nil
				l_txt = vlang[txt][l]
				if l_txt.length() > 0
					return l_txt
				end
			elsif vlang[txt]["EN"] != nil
				l_txt = vlang[txt]["EN"]
				if l_txt.length() > 0
					return l_txt
				end
			end
		rescue
		end
		txt
	end

	def self.getSelectedLanguage(cookies)
		if cookies['lang'] != nil
			cookies['lang'].upcase()
		else
			'EN'
		end
	end
end