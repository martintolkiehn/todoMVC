console.log '-- preparing couchbase for testing --'

Couchbase = require 'couchbase'
Promise = require 'bluebird'

DbConfig = require '../couchbase-db-config'

DbConfig.bucketName = 'todoMVCTest'

cluster = new Couchbase.Cluster DbConfig.connectionString
bucket = cluster.openBucket DbConfig.bucketName, (err) ->
  console.error 'ERROR: problen on open couchbase database', err if err?

initialDoc =
  todos: [
      {
        id: 1
        text: 'Milch holen'
        completed: false
      }
      {
        id: 2
        text: 'Müll runter tragen'
        completed: true
      }
      {
        id: 3
        text: 'Oma Bescheid sagen'
        completed: false
      }
      {
        id: 4
        text: 'Ticket buchen'
        completed: true
      }
  ]

new Promise (fulfill, reject) ->
  bucket.get DbConfig.documentId, (error, result) ->
    if error?
      bucket.insert DbConfig.documentId, initialDoc, (error, result) ->
        console.log 'DB Error: ', error if error?
    else
      bucket.replace DbConfig.documentId, initialDoc, (error, result) ->
        console.log 'DB Error: ', error if error?
