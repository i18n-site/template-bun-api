> ./app.js

server = Bun.serve({
  development: false
  fetch: app.fetch
})

{
  address: {
    address
    port
  }
} = server

console.log 'http://127.0.0.1:'+port

shutdown = =>
  console.log('granceful shutdown')
  await server.stop()
  process.exit(0)
  return

[
  'SIGINT',
  'SIGTERM'
].forEach (signal) =>
  process.once signal, shutdown
  return
