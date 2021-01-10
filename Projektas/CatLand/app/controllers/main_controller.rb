class MainController < ApplicationController
	skip_before_action :verify_authenticity_token

	def prisijungimas
		@user_name = ''
		@info_pass = ''

		if params['submit'] != nil
			name = params['name']
			user = User.where(name: name).first
			if user != nil
				sha1 = Digest::SHA1.new
				sha1 << params['pass']
				pass = sha1.hexdigest
				if user[:pass] == pass
					userc = User_contact.where(user_id: user[:id]).first
					if userc != nil
						session[:fullname] = userc[:fname]+' '+userc[:lname];
					else
						session[:fullname] = user[:name]
					end 
					session[:id] = user[:id]
					session[:name] = user[:name]
					session[:on] = true
					redirect_to :controller => 'main', :action => 'paskyra' and return
				else
					@user_name = name
					@info_pass = Lang.get("PasswordIsIncorrect", cookies)
				end
			else
				@info_pass = Lang.get("UserNameIsIncorrect", cookies)
			end
		end
	end

	def registracija
		if params['submit'] != nil
			fname = params['fname'] != nil ? params['fname'] : ''
			lname = params['lname'] != nil ? params['lname'] : ''
			email = params['email'] != nil ? params['email'] : ''
			phone = params['phone'] != nil ? params['phone'] : ''
			name = params['name'] != nil ? params['name'] : ''
			pass1 = params['pass1'] != nil ? params['pass1'] : ''
			pass2 = params['pass2'] != nil ? params['pass2'] : ''
			if pass1.length > 0 && pass2.length > 0 && pass1 == pass2
				sha1 = Digest::SHA1.new
				sha1 << pass1
				pass = sha1.hexdigest
				user = User.new(name: name, pass: pass)
				user.save
				user = User.where(name: name, pass: pass).first
				if user != nil
					userc = User_contact.new(
						user_id: user[:id],
						fname: fname,
						lname: lname,
						email: email,
						phone: phone
					)
					userc.save
					if userc != nil
						session[:fullname] = userc[:fname]+' '+userc[:lname];
					else
						session[:fullname] = user[:name]
					end 
					session[:id] = user[:id]
					session[:name] = user[:name]
					session[:on] = true
					redirect_to :controller => 'main', :action => 'paskyra' and return
				end
			end
		end
	end

	def paskyra
		if session[:on] != nil
			@info_pass = ''
			@info_name = ''
			
			if params['user_name'] != nil
				on = true
				if params['name'] != nil && params['pass'] != nil
					user = User.where(id: session[:id]).first
					sha1 = Digest::SHA1.new
					sha1 << params['pass']
					pass = sha1.hexdigest
					if user[:pass] == pass
						user[:name] = params['name']
						user.save
						@info_name = Lang.get("NameChanged", cookies)
						on = false
					end
				end
				if on == true
					@info_name = '<span style="color:darkred">'
					@info_name << Lang.get("PasswordIsIncorrect", cookies)
					@info_name << '</span>'
				end
			end

			if params['user_pass'] != nil
				on = true
				if params['old-pass'] != nil && params['pass1'] != nil && params['pass2'] != nil
					if params['pass1'] == params['pass2']
						user = User.where(id: session[:id]).first
						sha1 = Digest::SHA1.new
						sha1 << params['old-pass']
						pass = sha1.hexdigest
						if user[:pass] == pass
							sha1 = Digest::SHA1.new
							sha1 << params['pass1']
							pass1 = sha1.hexdigest
							user[:pass] = pass1
							user.save
							@info_pass = Lang.get("PasswordChanged", cookies)
							on = false
						end
					end
				end
				if on == true
					@info_pass = '<span style="color:darkred">'
					@info_pass << Lang.get("PasswordIsIncorrect", cookies)
					@info_pass << '</span>'
				end
			end

			if params['ok_fname'] != nil && params['fname'] != nil
				user_contacts = User_contact.where(user_id: session[:id]).first
				user_contacts[:fname] = params['fname']
				user_contacts.save
				if user_contacts != nil
					session[:fullname] = user_contacts[:fname]+' '+user_contacts[:lname];
				else
					session[:fullname] = session[:name]
				end
			end

			if params['ok_lname'] != nil && params['lname'] != nil
				user_contacts = User_contact.where(user_id: session[:id]).first
				user_contacts[:lname] = params['lname']
				user_contacts.save
				if user_contacts != nil
					session[:fullname] = user_contacts[:fname]+' '+user_contacts[:lname];
				else
					session[:fullname] = session[:name]
				end 
			end

			if params['ok_email'] != nil && params['email'] != nil
				user_contacts = User_contact.where(user_id: session[:id]).first
				user_contacts[:email] = params['email']
				user_contacts.save
			end

			if params['ok_phone'] != nil && params['phone'] != nil
				user_contacts = User_contact.where(user_id: session[:id]).first
				user_contacts[:phone] = params['phone']
				user_contacts.save
			end
			
			@user = User.where(id: session[:id]).first
			@user_contacts = User_contact.where(user_id: session[:id]).first
		else
			redirect_to :controller => 'main', :action => 'prisijungimas' and return
		end
	end

	def rezervuoti
		if session[:on] != nil
			if params['submit'] != nil
				name = params['name'] != nil ? params['name'] : ''
				gender = params['gender'] != nil ? params['gender'] : ''
				sterilization = params['sterilization'] != nil ? params['sterilization'] : 'off'
				room_type = params['room_type'] != nil ? params['room_type'] : ''
				date_nuo = params['date_nuo'] != nil ? params['date_nuo'] : ''
				date_iki = params['date_iki'] != nil ? params['date_iki'] : ''
				if name.length > 0 && gender.length > 0 && room_type.length > 0 && date_nuo.length > 0 && date_iki.length > 0
					sterilization = sterilization == 'on' ? 1 : 0
					room = room_type.to_i
					rezervota = Rezervuoti.new(
						user_id: session[:id],
						name: name,
						gender: gender,
						sterilization: sterilization,
						room: room,
						nuo: date_nuo,
						iki: date_iki
					)
					rezervota.save
					redirect_to :controller => 'main', :action => 'rezervuoti_ok' and return
				end
			end

			if params['delete_item'] != nil
				id = params['idcode'] != nil ? params['idcode'] : 0
				Rezervuoti.where(user_id: session[:id], id: id).destroy_all
			end
			
			@ivykdyta = Rezervuoti.where(user_id: session[:id])
		else
			redirect_to :root and return
		end
	end
	
end
