import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application


export { application }

import Notification from 'stimulus-notification'

const application = Application.start()
application.register('notification', Notification)
