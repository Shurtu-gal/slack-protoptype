const channels = require('./.github/workflows/slack/channels.json');

function transform(channels) {

  return channels.channels.filter((channel) => {
    return !channel.is_archived;
  }).map((channel) => { 
    return {
      name: channel.name,
      topic: channel.topic,
      purpose: channel.purpose,
      is_private: channel.is_private,
      is_archived: channel.is_archived,
    };
  });
}

let transformed = transform(channels);
// remove duplicates
transformed = transformed.filter((channel, index, self) =>
  index === self.findIndex((t) => (
    t.name === channel.name
  ))
);

// sort by name
transformed.sort((a, b) => {
  return a.name.localeCompare(b.name);
});

// convert to yaml

let yaml = ''

transformed.forEach((channel) => {
  yaml += `
    - name: ${channel.name}
      topic: ${channel.topic}
      purpose: ${channel.purpose}
      is_private: ${channel.is_private}
      is_archived: ${channel.is_archived}
      action_on_destroy: archive
  `;
})

console.log(yaml);

