# CRUD Nitrogen Plugin

## Intro
This is a basic plugin is inspired by DataTables, which seems to be easier to implement using [Nitrogen Web Framework](http://nitrogenproject.com), than to integrate to project as is.

It's universal solution as it is not related to any DB or datasourse. It's up to you how to get and write data to your datasourse.

## Adding a Nitrogen Plugin to Your Nitrogen App (post 2.2.0)

Modify your rebar.config file and add to the `deps` section the following:

```erlang
{nitrogen_crud, ".*", {git, "git://github.com/T0ha/nitrogen_crud.git", {branch, master}}}
```

Then run `make` in your application.


## Usage example
An element rendering module should look something like this:

```erlang
-module (crud_example).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-compile(export_all).

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Welcome to Nitrogen CRUD".

body() ->
     #crud{
       pagination_class=["btn", "btn-default"],
       button_class=["btn", "btn-link"],
       table_class=["table-striped", "table-bordered", "table-hover"],
       start=0,
       count=10,
       cols=[
             {name, "Name", tb},
             {description, "Description", ta},
             {file, "Path", none},
             {type, "Type", {select, types()}}
            ],
       funs=#{
         list => fun list/0,
         update => fun update/1, 
         delete => fun delete/1
        }
      }.

list() ->
[
    #{record => some_table,
     name => "Chapter1",
     description => "This is first chapter of our example",
     file => "/tmp/chapter1.rtf",
     type => binary},
    #{record => some_table,
     name => "Image1",
     description => "This is image for first chapter of our example",
     file => "/tmp/chapter1.gif",
     type => image},
    #{record => some_table,
     name => "Script",
     description => "Some script here",
     file => "/tmp/script.js",
     type => script}
].

update(Map) ->
    wf:info("Updating ~p", [Map]).

delete(Map) ->
    wf:info("Removing ~p", [Map]).
 
types() ->
    [{css, "CSS"},
     {script, "Script"},
     {image, "Image"},
     {binary, "Other"}].
```

