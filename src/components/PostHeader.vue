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
              <g-link :to="`${post.author.path}/`" class="text-white capitalize border-b border-transparent hover:border-white transition-border-color">
                {{ titleCase(post.author.title) }} 
              </g-link>

              &bull;
            </span>
            
            <time :datetime="post.datetime" class="capitalize">
              {{ formattedPublishDate }}
            </time>
          </p>
        </div>
      </div>

      <ClientOnly>
        <Parallax :speed-factor="speedFactor" :sectionHeight="80">
          <g-image :src="post.cover" :alt="post.title" />
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
        
        <div class="font-bold flex text-center justify-between items-baseline mx-auto m0-8 max-w-md mb-6">
          <p class="mr-0 md:mr-8 text-white text-base w-full md:w-auto">
            <span v-if="post.author">
              By 
              <g-link :to="`${post.author.path}/`" class="font-bold text-white border-b border-transparent hover:border-white transition-border-color">
                {{ titleCase(post.author.title) }}
              </g-link>
            </span>
          </p>

          <p class="text-white text-base">
            {{ post.timeToRead }} min read
          </p>

          <p class="break mb-6 visible md:hidden"></p>
            
          <p>
            <time :datetime="post.datetime" class="capitalize text-white text-base">
              {{ formattedPublishDate }}
            </time>
          </p>
        </div>
      </div>
    </div> 
  </header>
</template>

<script>
import moment from 'moment'
import Parallax from "vue-parallaxy"

export default {
  // TODO: Yeah, this isn't exactly ideal re: type safety
  props: ['post'],

  components: { Parallax },

  methods: {
    titleCase(str) {
      return str.replace('-', ' ')
                .split(' ')
                .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
                .join(' ')
    }
  },

  computed: {
    formattedPublishDate() {
      // TODO: Ditch moment for something more lightweight
      return moment(this.post.datetime).format('MMMM DD, YYYY');
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
