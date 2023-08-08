<template>
  <div class="content-card">
    <div class="bg-white py-3 rounded-b-lg">
      <a :href="content.url">
        <h3 class="font-bold text-4xl link-pretty">
            {{ content.name }}
        </h3>
      </a>

      <hr class="mb-2" />

      <p class="text-gray-700 text-sm">
        <nuxt-content :document="content" />
      </p>
    </div>

    <a :href="content.url">
      <nuxt-img
        class="card-cover"
        :src="content.image"
        :alt="`${content.name}'s homepage`"
        sizes="sm:100vw md:675px lg:800px"
        densities="x1 x2"
        format="webp"
        loading="lazy"
      />
    </a>

    <div class="rainbow-rule rainbow-break"></div>
  </div>
</template>

<script>
  export default {
    props: {
      content: {
        type: Object
      }
    },

  }
</script>
<style lang="postcss">
  .content-card {
    .card-cover {
      padding: 1rem;
      background: whitesmoke;
      border: 1px solid lightgray;
      border-radius: 8px;
    }

    hr {
      color: lightgray;
    }
  }
</style>
