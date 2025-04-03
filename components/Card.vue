<template>
  <li class="card">
    <nuxt-img
      class="card-cover"
      :src="post.cover"
      :alt="post.alt"
      sizes="sm:100vw md:350px"
      densities="x1 x2"
      format="webp"
      loading="lazy"
    />

    <div class="card-details">
      <p class="link-pretty font-bold text-xl mb-2 truncate">
        <NuxtLink :to="`/blog/${post.slug}/`" class="">
          {{ post.title }}
        </NuxtLink>
      </p>

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
          alt: 'ROFL',
          tags: []
        }
      }
    },

    components: { TagList }
  }
</script>
<style lang="postcss">
.card {
  @apply flex flex-col;

  .card-cover {
    height: 11rem;
    min-width: 100%;
    @apply w-full rounded-t-lg bg-gray-300 object-cover;
  }

  .card-details {
    @apply bg-white px-6 py-3 rounded-b-lg flex-1;
  }
}

</style>
