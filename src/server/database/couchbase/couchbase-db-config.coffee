isHeroku = process.env.PORT?
couchbaseHost = if isHeroku then '46.101.223.167:8091' else '127.0.0.1'

module.exports =
  connectionString: "couchbase://#{couchbaseHost}"
  bucketName: 'todoMVC'
  documentId: 'todos'
