<template>
  <section class="recent-work bg-glass border-b-glass px-12 md:px-24 pb-24">
    <h2 class="flex justify-between items-center max-w-6xl mx-auto">
      <span class="text-4xl">
        Recent {{ title }}
      </span>
    </h2>

    <ul class="grid grid-rows-auto grid-cols-2 gap-12 lg:grid-cols-3 xl:grid-cols-4 grid-flow-row max-w-6xl mx-auto mt-16 flex-col md:flex-row flex-wrap">
      <!-- TODO: This naming scheme is non-intuitive -->
      <Card
        v-for="article in articles"
        :key="article.slug"
        :post="article"
      />
    </ul>
  </section>
</template>

<script>
  import Card from '@/components/Card'

  export default {
    components: { Card },
    props: {
      articles: {
        type: Array,
        default: []
      },
      title: {
        type: String,
        default: 'Content'
      }
    }
  }
</script>
