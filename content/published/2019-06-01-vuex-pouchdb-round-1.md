---
title: "Sarah vs the Forces of PWA, Round 1"
description: "vuex pouchdb pwaaaaaaaa"
date: 2019-02-27 17:54:43
author: Sarah Robin
tags: ['mobile', 'tech', 'vue', 'featured']
---​
	Okay, context. I think I've told you a bit about the MVC architecture, right? Quick refresher anyways: M for Model = your single source of truth, usually the thing that iteracts w/ the DB, V for View = bind data to templates & format as needed, C for Controller = Orchestrates what data to get from the Model and controls what data goes to the View. clientside applications are functionally the View, or the template the View gets bound to.

​	So, say in my client side web app, Pill Panda, is written in Vue.js, so its  composed of components. There's more to Vue, but functionally, these components work like a custom web element. So, like, tired of `<h1>`? try out `<BIGFUCKINGTEXT>` in your templates! Its structured as a component tree, so essentially what I do is stuff the top-level component into an empty div on the page and let Vue manage the rest of the HTML via Vue components.

​	Vue components are composed of 3 parts: Templates, scripts, and styles. It doesn't quite map to MVC, but it does map to HTML, JS, and CSS 100%! `<template>` is your HTML w/ the ability to inject JS in them, `<script>` contains the JS definition for the component, and `<style>` has CSS, all in one file that ends in .vue

​	So, generally speaking, the way one goes about architecting a client side app these days is: 1) pick component framework (React, Vue, etc), 2) Figure out if your app is going to need some sort of routing to its component hierarchy, 3) implement some sort of functional-programming based centralized state store. Redux and Vuex are the most common

​	They basically enable you to have a big ol' JS object at the center of your app, your model of models, your single source of truth that syncs w/ whatever APIs or services you'd like to consume for the functionality you'd like. If you want to change the store's state, you emit an action - actions are explicitly named (or typed) objects as well as an optional payload. Actions can trigger either other actions or changes in the central state store.

​	Quick example - say you have a login form built in vue. You fill in your information, and you click a button. When that button is pressed, the login form component tree its inside emits an action to login, with a payload of your login credentials from the form (also inside the component tree). That action hits your API, the API validates your login attempt and returns an auth token and some user data. That completes the action, which triggers a secondary action to take the API response and mutate the central state store to have the auth token saved.

​	Additionally, the central store being an awfully convenient place for sync to happen, you have a localStorage plugin active, that caches that auth token and syncs on page refresh

​	You refresh the page, the app loads again, but on initialie, that auth token is read from localStorage and then the component tree reads from the central state and proceeds to your user page or whatevs

​	So, like, what tripped me up w/ Pill Panda is how do I sync my centralized state store into pouchDB? Like... do I have to manually do it? How often should I do it? Should I just have a periodic sync, or should I have it be transactional, with each mutation of the central state store being reflected in the local db?

​	I looked for a while, and there's a couple of half-baked solutions - there's libraries for making local DBs easy to work with, and some of them integrate them with Vue, but there doesn't seem to be anything that doesn't force you to do it manually in some way, shape or form.

​	So I was figuring out how to like... mutate the central state store *and* the db, and I was like... this is kinda a pita. shouldn't this not be a pita? wasn't diana's really simple? I should look at that.

​	And son of a bitch. 

​	Hey, this is where you said you needed me to stop. And I want you to know that was 1000% okay, and I'm glad you let me know. Ilu, here's the rest:

​	She just omits the centralized state store entirely. Like, components just dive right down into the DB. Each component is responsible for its own data needs. There's a schema, and the DB is just in global context. Its like... 1 model, with a bunch of small, composable apps that feed off of it in the same context. Its... remarkably simple.

​	And that's what I'm kinda marveling over. Most vue apps rn have pouchdb act like a redundancy mechanism or a nice add-on. But it can just wholesale replace your centralized state store, no need for vuex. I'm thinking of having actions that manipulate the local pouchDB instance, and skipping the rest. So Vue would still work the way it normally does, 

​	But here's the problem: It still would have to pull the DB data into local state. So basically, I'd just be skipping the vuex/redux pattern entirely and it'd work the same as an API that way. Hrm. 

​	So, then the best way to structure this would be central state at the tab level - each tab 



​	Update! Its **11:17pm** and I'm going to make a vuex plugin that syncs state w/ pouchdb off the main render thread. https://medium.com/@djave_co_23356/a-super-simple-vuex-localstorage-plugin-de7820828b10 has most of what I'm looking for here. vue-worker should be adequate for any rough calculations, and the above tutorial just needs to replace localStorage w/ pouchDB and we good.