<template>
  <li class="card">
    <img
      class="card-cover"
      :src="post.cover"
      :alt="post.title"
    />

    <div class="bg-white px-6 py-3 rounded-b-lg">
      <h4 class="font-bold text-xl mb-2">
        <NuxtLink :to="`/blog/${post.slug}/`" class="">
          {{ post.title }}
        </NuxtLink>
      </h4>

      <p class="text-gray-700 text-sm">
        {{ post.description }}
      </p>

      <ul v-if="post.tags && post.tags.length > 0" class="card-tag-grid">
        <li v-for="(tag, i) in post.tags" :key="`${tag}-${i}`" class="card-tag">
          #{{ tag }}
        </li>
      </ul>
    </div>
  </li>
</template>

<script>
  export default {
    props: {
      post: {
        type: Object,
        default: {
          title: 'LMAO',
          description: 'ROFL',
          cover: 'http://placehold.it/400x300'
        }
      }
    },

  }
</script>
