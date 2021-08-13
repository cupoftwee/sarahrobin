<template>
  <section v-if="tags.length > 0" class="width-screen">
    <NuxtLink
      v-for="tag in tags"
      :key="tag"
      :to="`/tag/${tag}/`"
      class="text-white hover:bg-pink-400 hover:bg-white hover:text-white hover:border-white border-2 border-white-400 font-sans font-bold text-xs sm:text-sm px-4 py-2 mr-4 mb-2 rounded-full transition-color transition-bg"
    >
      <svg class="inline w-3 fill-current align-middle mr-1" viewBox="0 0 20 20" role="img" xmlns="http://www.w3.org/2000/svg">
        <path d="M0 10V2l2-2h8l10 10-10 10L0 10zm4.5-4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
      </svg>

      {{ tag }}
    </NuxtLink>
  </section>
</template>
<script>
  export default {
    props: {
      tags: {
        type: Array,
        default: []
      }
    }
  }
</script>
