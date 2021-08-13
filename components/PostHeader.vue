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
    <div class="pt-4 md:pt-24 border-b-glass-thin">
      <div class="max-w-xl md:max-w-3xl xl:max-w-4xl mx-auto text-center px-6">
        <h1 v-if="post.title || title" class="text-white text-4xl lg:text-6xl leading-tight font-sans font-bold mb-2">
          {{ post.title }}
        </h1>

        <p v-if="post.description || description" class="text-white max-w-xl mx-auto text-lg md:text-xl">
          {{ post.description }}
        </p>

        <div class="font-bold flex flex-wrap flex-row-reverse md:flex-row text-center justify-center content-around items-baseline w-full m0-8  mb-6">
          <p v-if="post.date || date" class="pr-4">
            <time :datetime="post.date" class="capitalize text-white text-base">
              {{ formattedPublishDate }}
            </time>
          </p>

          <p v-if="post.readingTime || readingTime" class="text-white text-base pr-4">
            {{ post.readingTime }}
          </p>

          <TagList v-if="post.tags || tags" :tags="post.tags" />

        </div>

      </div>
    </div>
  </header>
</template>

<script>
// import Parallax from "vue-parallaxy" // for cover images
import TagList from '@/components/TagList'

export default {
  props: {
    post: {
      type: Object,
      default: {
        title: "",
        description: "",
        date: undefined,
        readingTime: "",
        tags: [],
        cover: ""
      }
    },
    title: String,
    description: String,
    date: Date,
    readingTime: String,
    tags: Array,
    cover: String
  },

  components: { TagList },

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
