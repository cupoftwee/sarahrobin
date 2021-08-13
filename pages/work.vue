<template>
   <div class="bg-rainbow narrow">
     <div
       class="post-content width-screen bg-white mx-auto px-2 sm:px-12 pt-12"
       :class="'border-b-glass border-grey-lighter'"
     >
       <div class="mx-auto max-w-3xl xl:max-w-4xl px-8 md:px-12">
        <h1 class="text-6xl">My Work</h1>
        <p>A few choice cuts from my various professional endeavors</p>

        <div class="rainbow-rule" style="margin-bottom: 4rem;"></div>

        <ul class="work-list">
          <li
            v-for="project in projects"
            :key="project.url"
          >
            <ContentCard :content="project" />
          </li>
        </ul>

       </div>
     </div>
   </div>
</template>
<script>
  import ContentCard from '~/components/ContentCard.vue';

  export default {
    components: {
      ContentCard
    },
    async asyncData({ $content, params: { slug } }) {
      const projects = await $content('work')
        .sortBy('createdAt', 'asc')
        .fetch()

      return { projects }
    }
  }
</script>
<style>
  .work-list {
    @apply mt-8;
  }
</style>
