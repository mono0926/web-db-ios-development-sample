require 'grocer'

pusher = Grocer.pusher(
  certificate: "./development_com.mono0926.web-db-sample.pem"
)

notification = Grocer::Notification.new(
  device_token:      "YOUR_DEVICE_TOKEN",
  alert:             "Hello WEB+DB",
  badge:             1,
  sound:             "Default",
  expiry:            Time.now + 60*60,
  identifier:        1234,
  content_available: true,
  category:          "category-identifier"
)

pusher.push(notification)