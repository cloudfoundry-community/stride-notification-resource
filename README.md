# stride-notification-resource

A Concourse resource for sending messages to stride

## How to Use

Add this to your resource types

```yaml
resource_types:
- name: stride-notification
  type: docker-image
  source:
    repository: starkandwayne/stride-notification-resource
```

Make a resource of that type and configure it

```yaml
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
* **document**: An Atlassian Document (https://developer.atlassian.com/cloud/stride/apis/document/structure) that gets sent as the Stride message. The contents of this should be a YAML map (not a string, just a map nested under `document`) or a literal JSON string.
* **message**: A shorthand for **params.document** that just sends this string as a plain text message.

Either params.document or params.message must be defined.

```yaml
jobs:
- name: test
  serial: true
  plan:
  - put: stride
    params:
      conversation: "botspam"
      message: "beep boop"
```
