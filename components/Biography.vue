<template>
  <section class="home-about flex justify-around bg-white sm:mt-12 md:mt-0 sm:px-12 md:px-32 sm:py-12 md:py-24">
    <div class="about-bio max-w-sm p-6 lg:px-0 lg:max-w-3xl">
      <p id="about" class="bio-intro text-3xl font-thin mt-0 mb-0 ml-0 text-center md:text-left">
        Hi! My name's Sarah and
      </p>

      <h2 class="gradient-headline text-5xl md:text-6xl text-center leading-tight md:text-left lg:leading-relaxed">
        I make pretty web things.
      </h2>

      <div>
        <p class="font-light text-lg mb-14 px-4 leading-normal md:font-thin md:text-3xl md:px-0">
          I work mostly as a web developer, but I occasionally chip in as a UI/UX engineer, and product manager. I like to wear many hats and learn a breadth of skills around my primary focus: Making accessible, sustainable, &amp; inclusive software.
        </p>

        <div v-if="teaser" class="mt-12 flex justify-end">
          <NuxtLink to="/about" class="button text-md font-bold border-2 text-pink-500 border-pink-500 rounded-full px-6 py-3 mb-4 hover:no-underline hover:text-white hover:bg-pink-500 transition-bg">
            Learn more about moi! &rarr;
          </NuxtLink>
        </div>

        <p v-if="!teaser" class="font-light text-lg lg:text-2xl px-4 mt-10">
          <span class="font-bold">For development</span>,

          I usually work w/ a varied Javascript stack for rapid prototyping
          and larger, full-stack projects. I also tinker in Phoenix, Ruby,
          and I'm learning Rust.

          You can find my code <a href="http://github.com/cupoftwee" target="_blank" class="font-bold text-lg lg:xl  link-pretty">
          on Github &#8594;</a>
          </a>
        </p>

        <p v-if="!teaser" class="font-light text-lg lg:text-2xl mt-10 px-4">
          <span class="font-bold">For design</span>,
          I try to practice an inclusive approach to product dev and UX that
          enables responsible growth. Design isn't only how it works, but also
          who it works for. You can see my design work<a href="http://dribbble.com/cupoftwee" target="_blank" class="font-bold text-lg lg:text-xl nav-link link-pretty">
          on Dribbble &#8594;</a>
        </p>

        <p v-if="!teaser" class="font-light text-lg lg:text-2xl mt-10 px-4">
          <span class="font-bold">For art</span>,
          I tend to work in CSS, Canvas, and SVG. My current passion is to
          program simulated life forms that scurry about, spilling pixels all
          over the canvas in frantic and beautiful ways. You can find my spilled
          pixels (and other artistic endeavors) <a href="https://glitch.com/@cupoftwee" target="_blank" class="font-bold text-lg lg:text-xl nav-link link-pretty">
          on Glitch &#8594;</a>
        </p>
      </div>
    </div>
  </section>
</template>

<script>
  export default {
    props: {
      teaser: {
        type: Boolean,
        default: false
      }
    }
  }
</script>

<style>
  .bio-intro {
    text-shadow: 2px 2px 3px rgba(255,255,255,0.1);
  }
</style>
