<template>
  <li class="content-card">
    <a :href="content.url">
      <img
        class="card-cover"
        :src="content.image"
        :alt="`${content.name}'s homepage`"
      />
    </a>

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


    <div class="rainbow-rule rainbow-break"></div>
  </li>
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
