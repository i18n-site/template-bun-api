> hono > Hono
  @8v/honobind
  ./index.js

app = new Hono()

honobind(app).get({
  '':index
})

# .post(
#   'send/:token':send
# )

export default app
