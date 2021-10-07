module notify

// Category defined in: https://www.galago-project.org/specs/notification/0.9/x211.html
pub enum Category {
	device // A generic device-related notification that doesn't fit into any other category.
	device_added //	A device, such as a USB device, was added to the system.
	device_error //	A device had some kind of error.
	device_removed // A device, such as a USB device, was removed from the system.
	email // A generic e-mail-related notification that doesn't fit into any other category.
	email_arrived // A new e-mail notification.
	email_bounced // A notification stating that an e-mail has bounced.
	im // A generic instant message-related notification that doesn't fit into any other category.
	im_error //	An instant message error notification.
	im_received // A received instant message notification.
	network // A generic network notification that doesn't fit into any other category.
	network_connected // A network connection notification, such as successful sign-on to a network service. This should not be confused with device.added for new network devices.
	network_disconnected //	A network disconnected notification. This should not be confused with device.removed for disconnected network devices.
	network_error // A network-related or connection-related error.
	presence //	A generic presence change notification that doesn't fit into any other category, such as going away or idle.
	presence_offline //	An offline presence change notification.
	presence_online // An online presence change notification.
	transfer //	A generic file transfer or download notification that doesn't fit into any other category.
	transfer_complete // A file transfer or download complete notification.
	transfer_error // A file transfer or download error.
	unknown
}

fn (c Category) str() string {
	match c {
		.device { return 'device' }
		.device_added { return 'device.added' }
		.device_error { return 'device.error' }
		.device_removed { return 'device.removed' }
		.email { return 'email' }
		.email_arrived { return 'email.arrived' }
		.email_bounced { return 'email.bounced' }
		.im { return 'im' }
		.im_error { return 'im.error' }
		.im_received { return 'im.received' }
		.network { return 'network' }
		.network_connected { return 'network.conected' }
		.network_disconnected { return 'network.disconnected' }
		.network_error { return 'network.error' }
		.presence { return 'presence' }
		.presence_offline { return 'presence.offline' }
		.presence_online { return 'presence.online' }
		.transfer { return 'transfer' }
		.transfer_complete { return 'transfer.complete' }
		.transfer_error { return 'transfer.error' }
		else { return '' }
	}
}

fn categories_to_string(c []Category) string {
	mut str := ''
	for i := 0; i < c.len; i++ {
		str += '${c[i]},'
	}
	str = str.trim_right(',')
	return str
}
