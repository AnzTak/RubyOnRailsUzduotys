function UserDataChange(self){
	var data = self.nextElementSibling;
	dom.removeClass(data,'btn-dark');
	dom.addClass(data,'btn-primary');
}

function ChangeFirstDate(self){
	var date_nuo = self.value;
	var date_iki = self.parentNode.nextElementSibling.lastElementChild;
	date_iki.value = date_nuo;
}

function ChangeLastDate(self){
	var date_iki = self.value;
	var date_nuo = self.parentNode.previousElementSibling.lastElementChild;
	if(date_nuo.value.length == 0 || date_nuo.value > date_iki){
		date_nuo.value = date_iki;
	}
}