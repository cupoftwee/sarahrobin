<template>
  <li class="card">
    <img
      class="card-cover"
      :src="post.cover"
      :alt="post.title"
    />

    <div class="card-details">
      <h4 class="link-pretty font-bold text-xl mb-2 truncate ...">
        <NuxtLink :to="`/blog/${post.slug}/`" class="">
          {{ post.title }}
        </NuxtLink>
      </h4>

      <p class="text-gray-700 text-sm">
        {{ post.description }}
      </p>
    </div>
  </li>
</template>

<script>
  import TagList from '@/components/TagList'

  export default {
    props: {
      post: {
        type: Object,
        default: {
          title: 'LMAO',
          description: 'ROFL',
          cover: 'http://placehold.it/400x300',
          tags: []
        }
      }
    },

    components: { TagList }
  }

  // <ul v-if="post.tags" class="card-tag-grid">
  //       <li v-for="(tag, i) in post.tags" :key="`${tag}-${i}`" class="card-tag">
  //         #{{ tag }}
  //       </li>
  //     </ul>
</script>
<style>
.card {
  @apply flex flex-col;

  .card-cover {
    height: 11rem;
    min-width: 100%;
    @apply w-full object-cover rounded-t-lg bg-gray-300 object-cover;
  }

  .card-details {
    @apply bg-white px-6 py-3 rounded-b-lg flex-1;
  }
}

</style>
