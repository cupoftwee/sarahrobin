<template>
  <DefaultLayout 
    :title="titleCase($page.tag.title)" 
    mode="glass" 
    :showNav="true" 
    class="bg-rainbow border-t-glass-thin"
  >
    <header class="border-b-glass">
      <div class="max-w-xl md:max-w-3xl xl:max-w-4xl flex flex-col-reverse mx-auto text-center px-6 pt-24 pb-10 md:py-32 border-b border-gray-300">
        <p class="text-white leading-normal">
          {{ $page.tag.belongsTo.totalCount }} posts in total
        </p>

        <h1 class="text-white text-4xl sm:text-5xl md:text-6xl font-sans font-bold mb-2 capitalize">
          {{ titleCase($page.tag.title) }}
        </h1>

        <svg class="w-5 sm:w-6 fill-current text-white mx-auto mb-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" role="img" aria-labelledby="tagIcon">
          <title id="tagIcon">Posts tagged</title>

          <path d="M0 10V2l2-2h8l10 10-10 10L0 10zm4.5-4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
        </svg>
      </div>
    </header>

    <section class="bg-white">
      <post-item v-for="edge in $page.tag.belongsTo.edges" :key="edge.node.id" :post="edge.node" />
    </section>

    <pagination 
      v-if="$page.tag.belongsTo.pageInfo.totalPages > 1"
      :base="`${$page.tag.path}`" 
      :info="$page.tag.belongsTo.pageInfo" 
    />
  </DefaultLayout>
</template>

<script>
import moment from 'moment'
import config from '~/.temp/config.js'
import PostItem from '@/components/PostItem'
import SiteFooter from '@/components/FooterMenu'
import Pagination from '@/components/Pagination'
import BackButton from '@/components/BackButton'

export default {
  components: {
    PostItem,
    Pagination,
    SiteFooter,
    BackButton
  },
  metaInfo () {
    return {
      title: `Posts tagged "${this.titleCase(this.$page.tag.title)}"`,
      meta: [
        {
          key: 'description',
          name: 'description',
          content: `Browse posts tagged "${this.titleCase(this.$page.tag.title)}"`
        },

        { property: "og:type", content: 'website' },
        { property: "og:title", content: `Posts tagged "${this.titleCase(this.$page.tag.title)}"` },
        { property: "og:description", content: `Browse posts tagged "${this.titleCase(this.$page.tag.title)}"` },
        { property: "og:url", content: `${this.config.siteUrl}/${this.$page.tag.path}/` },
        { property: "og:image", content: this.ogImageUrl },

        { name: "twitter:card", content: "summary_large_image" },
        { name: "twitter:title", content: `Posts tagged "${this.titleCase(this.$page.tag.title)}"` },
        { name: "twitter:description", content: `Browse posts tagged "${this.titleCase(this.$page.tag.title)}"` },
        { name: "twitter:site", content: "@cossssmin" },
        { name: "twitter:creator", content: "@cossssmin" },
        { name: "twitter:image", content: this.ogImageUrl },
      ],
    }
  },
  methods: {
    titleCase(str) {
      return str.replace('-', ' ').split(' ').map((s) => s.charAt(0).toUpperCase() + s.substring(1)).join(' ')
    }
  },
  computed: {
    config () {
      return config
    },
    ogImageUrl () {
      return `${this.config.siteUrl}/images/bleda-card.png`
    }
  },
}
</script>

<page-query>
query Tag ($path: String!, $page: Int) {
  tag (path: $path) {
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
            author {
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
