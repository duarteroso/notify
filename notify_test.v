module notify

import time

fn test_notification() {
	mut n := &Notification{}
	assert n.send()
	wait()
}

fn test_category() {
	mut n := &Notification{}
	n.title = 'Instant Messenger'
	n.message = '3 pending messages...'
	//
	assert !n.has_category(.im)
	n.add_category(.im)
	assert n.has_category(.im)
	//
	n.add_category(.device)
	assert n.has_category(.device)
	n.remove_category(.device)
	assert !n.has_category(.device)
	//
	assert n.send()
	wait()
}

fn test_urgengy() {
	mut n := &Notification{}
	//
	n.urgency = .normal
	n.title = 'Normal'
	n.message = 'Normal notification'
	assert n.send()
	wait()
	//
	n.urgency = .low
	n.title = 'Low'
	n.message = 'Low notification'
	assert n.send()
	wait()
	//
	n.urgency = .critical
	n.title = 'Critical'
	n.message = 'Critical notification'
	assert n.send()
	wait()
}

fn wait() {
	time.sleep(10000 * time.millisecond)
}
