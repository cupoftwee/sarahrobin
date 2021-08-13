<template>
  <section class="recent-work bg-glass border-b-glass px-12 md:px-24 pb-24">
    <h2 class="flex justify-between items-center">
      <span class="text-4xl">
        Recent {{ title }}
      </span>
    </h2>

    <ul class="card-grid mt-16 flex-col md:flex-row">
      <!-- TODO: This naming scheme is non-intuitive -->
      <Card
        v-for="article in articles"
        :key="article.slug"
        :post="article"
        class="card"
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
