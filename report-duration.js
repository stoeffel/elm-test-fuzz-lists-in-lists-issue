var readline = require("readline");
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

rl.on("line", function(line) {
  let parsed = JSON.parse(line);
  if (parsed.labels)
    console.log(parsed.labels.slice(3).join("\t"), "=>", parsed.duration);
});
