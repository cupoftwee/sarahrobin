<template>
  <li class="card">
    <g-image class="card-cover" :src="post.cover" :alt="post.title" />
    
    <div class="bg-white px-6 py-3 rounded-b-lg">
      <h4 class="font-bold text-xl mb-2">
        <g-link :to="`${post.path}/`" class="nav-link">
          {{ post.title }}
        </g-link>
      </h4>

      <p class="text-gray-700 text-sm">
        {{ post.description }}
      </p>

      <ul v-if="post.tags && post.tags.length > 0" class="card-tag-grid">
        <li v-for="(tag, i) in post.tags" :key="`${tag.title}-${i}`" class="card-tag">
          #{{ tag.title }}
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