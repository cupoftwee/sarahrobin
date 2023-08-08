<template>
  <section class="home-about flex justify-around bg-white md:mt-0 sm:px-12 md:px-32 sm:py-12 md:py-24">
    <div class="about-bio max-w-xl p-6 lg:px-0 lg:max-w-3xl">
      <p id="about" class="bio-intro text-3xl font-thin mt-0 mb-0 ml-0 text-center md:text-left">
        Hi! My name's Sarah and
      </p>

      <h2 class="gradient-headline text-5xl md:text-6xl text-center leading-tight md:text-left lg:leading-relaxed">
        I make pretty web things.
      </h2>

      <div>
        <p class="font-light text-lg mb-14 px-4 leading-normal md:font-thin md:text-2xl md:px-0">
          I'm an experienced web developer who's been working in the industry for the better part of the last decade, first as a web designer and UX engineer, but mostly as a frontend developer and full-stack engineer.
        </p>

        <div v-if="teaser" class="mt-12 flex justify-end">
          <NuxtLink to="/about" class="button text-md font-bold border-2 text-pink-500 border-pink-500 rounded-full px-6 py-3 mb-4 hover:no-underline hover:text-white hover:bg-pink-500 transition-bg">
            Learn more about moi! &rarr;
          </NuxtLink>
        </div>

        <p v-if="!teaser" class="font-light text-md xl:text-lg px-4 mt-10">
          <span class="font-bold">For development</span>,
          I usually work w/ a varied Javascript stack for rapid prototyping
          and larger, full-stack projects. I also tinker in Phoenix, Ruby,
          and I'm learning Rust. <br />
          You can find my code <a href="http://github.com/cupoftwee" target="_blank" class="font-bold text-md lg:text-lg nav-link link-pretty">
          on Github &#8594;</a>
        </p>

        <p v-if="!teaser" class="font-light text-md lg:text-lg mt-10 px-4">
          <span class="font-bold">For art &amp; design</span>,
          I tend to work in CSS, Canvas, and SVG. My current passion is to
          program simulated life forms that scurry about, spilling pixels all
          over the canvas in frantic and beautiful ways. <br />

          You can find my artistic endeavors <a href="http://dribbble.com/cupoftwee" target="_blank" class="font-bold text-md lg:text-lg nav-link link-pretty">
          on Dribbble &#8594;</a>
        </p>
      </div>

      <hr v-if="!teaser" class="rainbow-rule rainbow-break" />

      <div v-if="!teaser" class="bio-details flex flex-col-reverse md:flex-row">
        <div class="bio-photo flex flex-col justify-center mr-6 mt-6">
          <nuxt-img 
            class="rounded-max" 
            src="/images/author/profile-08-2021.jpg" 
            alt="A portrait of Sarah Robin wearing a floral facemask and thick eyeglasses with her brown hair tied back in a ponytail, taken in front of a transgender pride flag"
            sizes="sm:100vw md:400px lg:400px xl:400px"
            densities="x1 x2"
            format="webp"
            loading="lazy" 
          />

          <p class="bio-pronouns">(she/they)</p>
        </div>

        <div class="bio-personal font-light">
          <h3 class="text-center mb-2">Personal Life</h3>

          <p>
            Outside of work, I spend my time making art (ranging from model kits to watercolors to generative css experiments), cooking up a storm, and being entirely too finicky about tea. As well, I'm a devoted gardener and loving plant mom - I will send pictures of my garden if provoked!
          </p>

          <p>
            I also enjoy hiking, I'm learning to climb, and I enjoy a veritable bevvy of nerdy pasttimes. Feel free to ask me about them, as I will happily infodump about any of my interests!
          </p>
        </div>
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
<style lang="postcss">
  .bio-details img {
    border-radius: 1000px;
    border: 6px solid gainsboro;
    min-width: 250px;
  }
  .bio-intro {
    text-shadow: 2px 2px 3px rgba(255,255,255,0.1);
  }
  .bio-pronouns {
    margin-top: 12px;
    text-align: center;
    font-weight: bold;
  }
</style>
