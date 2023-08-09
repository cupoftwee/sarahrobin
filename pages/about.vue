<template>
  <DefaultLayout title="About Me" mode="sinebow" glassBorderB>
    <AuthorBio class="border-b-8 border-gradient" />

    <!-- <section>
      <post-item
        v-for="edge in $page.author.belongsTo.edges"
        :key="edge.node.id"
        :post="edge.node"
      />
    </section>

    <pagination
      v-if="$page.author.belongsTo.pageInfo.totalPages > 1"
      :base="`${$page.author.path}`"
      :info="$page.author.belongsTo.pageInfo"
    /> -->
  </DefaultLayout>
</template>

<script>
  import AuthorBio from '@/components/Biography'

  export default {
    components: {
      AuthorBio
    },

    methods: {
      titleCase(str) {
        return str.replace('-', ' ')
          .split(' ')
          .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
          .join(' ')
      }
    }
  }
</script>

<style lang="postcss">
  .author-info {
    @apply flex flex-col-reverse;
    @apply mx-auto  max-w-xl px-6 pt-24 pb-10;
    @apply text-center border-b-2 border-gray-300;
  }

  .author-name {
    @apply text-4xl font-sans font-bold mb-2 capitalize text-white;
  }
</style>
