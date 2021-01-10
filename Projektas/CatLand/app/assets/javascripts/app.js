function GetCookie(name)
{
	var ret = "";
	var cookie = this.document.cookie;
	var res = cookie.split(";");
	for(var i = 0; i < res.length; i++)
	{
		var coo = res[i].trim(' ').split("=");
		if(coo[0] && coo[0] == name)
		{
			if(coo[1]) {ret = coo[1];break;}
		}
	}
	return ret;
}

function CreateCookie(name, value, days)
{
	var expires = "";
	if(days)
	{
		var time = 60*60*24*days;
		expires = "; max-age="+time.toString();
	}
	this.document.cookie = name+"="+value+"; Path=/"+expires+";";
	return name+"="+value+"; Path=/"+expires+";";
}

function DeleteCookie(name)
{
	document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

function setLanguage(language)
{
	CreateCookie("lang",language.toLowerCase(),180);
	location.reload();
}

//---------------------------------------------------
//DOM
var dom = {
	/*
	 * Example:
	 *			dom.toParent(this,'tr','id')
	 *			dom.toParent(this,'tr',['id','class'])
	 *			dom.toParent(this,'tr',{id:55,class:'bg-info'})
	 * @self - this object
	 * @parentName - parent name (if string empty search by attribute)
	 * @attribute - String(name), Array(name,name), Object(name:value,name:value)
	 * @return - parent object (if not found return undefined)
	 */
	toParent: function(self,parentName,attribute){
		self = self.parentNode;
		var name_on = (parentName.length == 0 ? true : false);
		while(self != undefined && self.tagName != undefined){
			if(self.tagName.toLowerCase() == parentName.toLowerCase() || name_on){
				if(typeof attribute == 'string'){
					if(self.hasAttribute(attribute)){
						return self;
					}
					else{self = self.parentNode;}
				}
				else if(Array.isArray(attribute)){
					var on = false;
					for(var i = 0; i < attribute.length; i++){
						if(self.hasAttribute(attribute[i])){
							on = true;
						}
						else{on = false;break;}
					}
					if(on){
						return self;
					}else{self = self.parentNode;}
				}
				else if(typeof attribute == 'object'){
					var keys = Object.keys(attribute);
					var on = false;
					for(var i = 0; i < keys.length; i++){
						if(self.hasAttribute(keys[i])){
							if(self.getAttribute(keys[i]) == attribute[keys[i]]){
								on = true;
							}
							else{on = false;break;}
						}
						else{on = false;break;}
					}
					if(on){
						return self;
					}else{self = self.parentNode;}
				}
				else{
					if(name_on){
						self = self.parentNode;
					}else{
						return self;
					}
				}
			}else{
				self = self.parentNode;
			}
		}
		return undefined;
	},
	/*
	 * Example: dom.removeStyle(this,'color','margin')
	 * @self - this object
	 * @... - style names separated by comma
	 */
	removeStyle: function(self){
		if(self.hasAttribute('style')){
			var style_names = {};
			for(var i = 1; i < arguments.length; i++){
				style_names[arguments[i]] = arguments[i];
			}
			var styles = self.getAttribute('style');
			styles = styles.split(';');
			var n = styles.length;
			var rstyle = {};
			for(var i = 0; i < n; i++){
				if(styles[i].length > 0){
					var style_item = styles[i].split(':');
					if(style_item.length == 2){
						var name = style_item[0].trim();
						var value = style_item[1].trim();
						if(style_names[name] == undefined) {
							rstyle[name] = value;
						}
					}
				}
			}
			self.removeAttribute('style');
			var keys = Object.keys(rstyle);
			for(var i = 0; i < keys.length; i++){
				self.style[keys[i]] = rstyle[keys[i]];
			}
		}
	},
	/*
	 * Example: dom.removeClass(this,'m-3','bg-info')
	 * @self - this object
	 * @... - class names separated by comma
	 */
	removeClass: function(self){
		if(self.hasAttribute('class')){
			var class_names = {};
			for(var i = 1; i < arguments.length; i++){
				class_names[arguments[i]] = arguments[i];
			}
			var classes = self.getAttribute('class');
			classes = classes.split(' ');
			var n = classes.length;
			var rclass = '';
			for(var i = 0; i < n; i++){
				if(classes[i].length > 0){
					if(class_names[classes[i]] == undefined) {
						rclass += classes[i] + ' ';
					}
				}
			}
			rclass = rclass.trim();
			if(rclass.length > 0){
				self.setAttribute('class',rclass);
			}else{
				self.removeAttribute('class');
			}
		}
	},
	/*
	 * Example: dom.addClass(this,'p-2')
	 * @self - this object
	 * @class_name - class name
	 */
	addClass: function(self,class_name){
		if(self.hasAttribute('class')){
			var existing_class = self.getAttribute('class');
			existing_class = existing_class.trim();
			var classes = existing_class.split(' ');
			var n = classes.length;
			var on = true;
			for(var i = 0; i < n; i++){
				if(classes[i] == class_name){on = false;break;}
			}
			if(on){existing_class += ' '+class_name;}
			self.setAttribute('class',existing_class);
		}else{
			self.setAttribute('class',class_name);
		}
	},
	/*
	 * Example: dom.hasClass(this,'bg-info')
	 * @self - this object
	 * @class_name - class name
	 * @return:boolean - return true if class found
	 */
	hasClass: function(self,class_name){
		if(self.hasAttribute('class')){
			var classes = self.getAttribute('class');
			classes = classes.split(' ');
			var n = classes.length;
			for(var i = 0; i < n; i++){
				if(classes[i].length > 0){
					if(classes[i] == class_name) {
						return true;
					}
				}
			}
		}
		return false;
	}
};
