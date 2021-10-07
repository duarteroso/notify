module notify

import os

pub struct Notification {
pub mut:
	app_name   string
	title      string = 'Title'
	message    string = 'Message'
	icon       string = 'dialog-information'
	timeout    u32    = 5000
	categories []Category
	urgency    Level = .normal
}

/*
-a, --app-name=APP_NAME: specifies the application name for the icon.
-h TYPE:NAME:VALUE, --hint=TYPE:NAME:VALUE: specifies basic extra data to pass. The possible values of TYPE are: int, double, string or byte.
*/

pub fn (mut n Notification) add_category(c Category) {
	if c in n.categories {
		return
	}

	n.categories << c
}

pub fn (mut n Notification) remove_category(c Category) {
	for i := 0; i < n.categories.len; i++ {
		if n.categories[i] == c {
			n.categories.delete(i)
			break
		}
	}
}

pub fn (n Notification) has_category(c Category) bool {
	return c in n.categories
}

pub fn (n Notification) str() string {
	mut cmd := 'notify-send'
	//
	cmd += ' \'$n.title\''
	cmd += ' \'$n.message\''
	//
	cmd += ' --app-name=\'$n.app_name\''
	//
	cmd += ' --icon=$n.icon'
	//
	cmd += ' --expire-time=$n.timeout'
	//
	categories := categories_to_string(n.categories)
	cmd += ' --category=$categories'
	//
	cmd += ' --urgency=$n.urgency'
	//
	cmd += ' --hint=string:sound-name:message-new-email'
	//
	return cmd
}

pub fn (n Notification) send() bool {
	println('')
	println(n)
	println('')
	res := os.execute(n.str())
	return res.exit_code == 0
}
