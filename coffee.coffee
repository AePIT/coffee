@People = new Mongo.Collection("people");
@Done = new Mongo.Collection('done');

if Meteor.isClient

  Template.people.helpers
    people: ->
      People.find({}, {sort: {done: 1}})
    create: ->

    rendered: ->


    destroyed: ->


  Template.body.events
    "click #add": (event, template) ->
       date = new Date();
       data =
         name: $('#person').val()
         done: 0
       People.insert data
  Template.people.events
   'click .one': ->
       People.update {@_id}, {$inc: {done:-1}}
   'click .two': ->
       People.update {@_id}, {$inc: {done:1}}
