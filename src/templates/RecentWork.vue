<template>
  <section class="recent-work bg-glass border-b-glass px-12 md:px-32 pb-24">
    <h2 class="flex justify-between items-center">
      <span class="text-4xl">
        Recent Work
      </span>

      <!-- <span>
        <g-link to="/writing" class="button text-md font-bold border-2 text-white border-white rounded-full px-6 py-3 hover:no-underline hover:text-pink-500 hover:bg-white transition-bg">
          See All &#8594;
        </g-link>
      </span> -->
    </h2>

    <ul class="card-grid mt-16 flex-col md:flex-row">
      <!-- TODO: This naming scheme is non-intuitive -->
      <Card 
        v-for="edge in posts.edges" 
        :key="edge.node.id" 
        :post="edge.node"
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
      posts: {
        type: Object,
        default: {}
      }
    },
    computed: {
      recentPosts() {
        return this.$pages.posts.edges.slice(0, 3);
      }
    },
  }
</script>