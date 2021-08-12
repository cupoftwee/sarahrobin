<template>
  <header>
    <!-- Cover image markup still WIP - add v-if="post.cover" when ready -->
    <!-- <div class="post-cover overflow-hidden relative" style="max-height:60vh;">
      <div :class="fullscreenStyles" class="max-w-xl md:max-w-3xl xl:max-w-4xl text-center px-6 absolute z-10">
        <div class="m-auto">
          <p class="text-white text-xs mb-2 uppercase">
            {{ post.timeToRead }} min read
          </p>

          <h1 class="text-3xl sm:text-5xl font-sans font-bold leading-tight mb-2 text-white">
            {{ post.title }}
          </h1>

          <p class="text-white">
            <span v-if="post.author">
              <NuxtLink to="blog" class="text-white capitalize border-b border-transparent hover:border-white transition-border-color">
                {{ titleCase(post.author) }}
              </NuxtLink>

              &bull;
            </span>

            <time :datetime="post.date" class="capitalize">
              {{ formattedPublishDate }}
            </time>
          </p>
        </div>
      </div>

      <ClientOnly>
        <Parallax :speed-factor="speedFactor" :sectionHeight="80">
          <img :src="post.cover" :alt="post.title" />
        </Parallax>
      </ClientOnly>
    </div> -->

    <!-- non-cover image markup -->
    <div class="pt-24 border-b-glass-thin">
      <div class="max-w-xl md:max-w-3xl xl:max-w-4xl mx-auto text-center px-6">
        <h1 class="text-white text-4xl lg:text-6xl leading-tight font-sans font-bold mb-2">
          {{ post.title }}
        </h1>

        <p class="text-white max-w-xl mx-auto text-lg md:text-xl">
          {{ post.description }}
        </p>

        <div class="font-bold flex text-center justify-center content-around items-baseline w-full m0-8  mb-6">
          <p class="pr-4">
            <time :datetime="post.datetime" class="capitalize text-white text-base">
              {{ formattedPublishDate }}
            </time>
          </p>

          <p class="text-white text-base pr-4">
            {{ post.readingTime }}
          </p>

          <p class="break mb-6 visible md:hidden"></p>

          <section v-if="post.tags" class="width-screen">
            <NuxtLink
              v-for="tag in post.tags"
              :key="tag"
              :to="`/tag/${tag}/`"
              class="text-white hover:bg-pink-400 hover:bg-white hover:text-white hover:border-white border-2 border-white-400 font-sans font-bold text-xs sm:text-sm px-4 py-2 mr-4 mb-2 rounded-full transition-color transition-bg"
            >
              <svg class="inline w-3 fill-current align-middle mr-1" viewBox="0 0 20 20" role="img" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 10V2l2-2h8l10 10-10 10L0 10zm4.5-4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
              </svg>

              {{ tag }}
            </NuxtLink>
          </section>

        </div>

      </div>
    </div>
  </header>
</template>

<script>
// import Parallax from "vue-parallaxy"

export default {
  // TODO: Yeah, this isn't exactly ideal re: type safety
  props: ['post'],

  components: { },

  methods: {
    titleCase(str = "") {
      return str.replace('-', ' ')
                .split(' ')
                .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
                .join(' ')
    }
  },

  computed: {
    formattedPublishDate() {
      const options = { year: 'numeric', month: 'long', day: 'numeric' };
      return new Date(this.post.date).toLocaleDateString('en', options);
    },

    fullscreenStyles() {
      const fullscreenStyles = 'flex flex-col items-center m-auto inset-0'
      const regularStyles = 'mx-auto bottom-0 inset-x-0 pb-16'

      return this.post.fullscreen ? fullscreenStyles : regularStyles;
    },

    speedFactor() {
      return this.post.fullscreen ? 0.21 : 0.37
    }
  },
}
</script>
