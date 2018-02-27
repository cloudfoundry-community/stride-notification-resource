# stride-notification-resource
A Concourse resource for sending messages to stride

## How to Use

Add this to your resource types
```
resource_types:
- name: stride-notification
  type: docker-image
  source:
    repository: starkandwayne/stride-notification-resource
```

Make a resource of that type and configure it
```
resources:
- name: stride
  type: stride-notification
  source:
    client_id: fippity
    client_secret: foppity
    cloud_id: foo
```

## Configuration

There is no configuration for `get` or `check` because... they don't do anything.

### Source
* **client_id**: The client ID of your application
* **client_secret**: The client secret of your application
* **cloud_id**: The id of your team's Stride instance. I usually find this by 
  going to app.stride.com, logging in, and looking at the URL
  
### Put Params
* **conversation**: The name of the channel (conversation) you want to post to. Make sure that your
  app is in the relevant conversation.
* **message**: The actual message that you want to send.

```
jobs:
- name: test
  serial: true
  plan:
  - put: stride
    params:
      conversation: "botspam"
      message: "beep boop"
```
