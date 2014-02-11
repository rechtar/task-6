class Task
    constructor: (@name, priority, done) ->
        @priority = ko.observable priority
        @done = ko.observable done
        @doneSymbol = ko.computed =>
            if @done then "yes" else "no"

class TasksViewModel
    constructor: ->
        @allPriorities = [
            { priority: "Normal" }
            { priority: "High" }
            { priority: "Urgent" }
        ]
        @tasks = ko.observableArray [
            new Task "Task 1", @allPriorities[0], true
            new Task "Task 2", @allPriorities[0], false
        ]
    addTask: =>
        @tasks.push new Task "", @allPriorities[0]
    removeTask: (task) =>
        @tasks.remove task

$(document).ready ->
    html = haml.compileHaml(sourceId: 'body', generator: 'coffeescript').call {}
    $("body").html html
    console.log html

    vm = new TasksViewModel
    ko.applyBindings vm
    window.vm = vm
