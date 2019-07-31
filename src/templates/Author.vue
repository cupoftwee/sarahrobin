<template>
  <DefaultLayout title="About Me" mode="rainbow" glassBorderB>
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
  import config from '~/.temp/config.js'
  import PostItem from '@/components/PostItem'
  import SiteFooter from '@/components/FooterMenu'
  import Pagination from '@/components/Pagination'
  import AuthorBio from '@/components/Biography'
  import NavMenu from '@/components/NavMenu'

  export default {
    components: {
      PostItem,
      Pagination,
      SiteFooter,
      AuthorBio,
      NavMenu
    },

    metaInfo () {
      return {
        title: `Posts written by ${this.titleCase(this.$page.author.title)}`,
        meta: [
          {
            key: 'description',
            name: 'description',
            content: `Browse posts written by ${this.titleCase(this.$page.author.title)}`
          }
        ],
      }
    },

    methods: {
      titleCase(str) {
        return str.replace('-', ' ')
          .split(' ')
          .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
          .join(' ')
      }
    },

    computed: {
      config () {
        return config
      }
    }
  }
</script>

<style>
  .author-info {
    @apply flex flex-col-reverse;
    @apply mx-auto  max-w-xl px-6 pt-24 pb-10;
    @apply text-center border-b border-gray-300;
  }
  
  .author-name {
    @apply text-4xl font-sans font-bold mb-2 capitalize text-white;
  }
</style>


<page-query>
  query Author ($path: String!, $page: Int) {
    author (path: $path) {
      id
      title
      path
      belongsTo (page: $page, perPage: 6) @paginate {
        totalCount
        pageInfo {
          totalPages
          currentPage
        }
        edges {
          node {
            ...on Post {
              id
              title
              datetime: date (format: "YYYY-MM-DD HH:mm:ss")
              path
              content
              excerpt
              description
              tags {
                id
                title
                path
              }
            }
          }
        }
      }
    }
  }
</page-query>
