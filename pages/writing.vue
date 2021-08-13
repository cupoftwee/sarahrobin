<template>
  <div class="bg-rainbow medium">
    <PostHeader :post="writingHeader" />

    <div
      class="post-content width-screen bg-white mx-auto px-6 sm:px-12 pt-12"
      :class="'border-b border-grey-lighter pb mb-16'"
    >
      <div class="mx-auto px-8 max-w-6xl pb-6">
        <ul class="articles">
          <li
            class="article"
            v-for="article of articles"
            :key="article.slug"
          >
            <NuxtLink :to="{ name: 'blog-slug', params: { slug: article.slug } }">
              <h4 class="link-pretty px-4 py-2 leading-tight">{{ article.title }}</h4>

              <img class="object-cover" :src="article.cover" />

              <div class="article-info px-4 py-2">
                <p class="text-sm text-gray-600">{{ article.teaser }}</p>
              </div>

              <TagList class="p-4" :tags="article.tags" dark />
            </NuxtLink>
          </li>
        </ul>

        <hr class="rainbow-rule rainbow-break mb-8 mt-4" />
      </div>
    </div>
  </div>
</template>

<script>
import SiteFooter from '@/components/FooterMenu'
import PostItem from '@/components/PostItem'
import Pagination from '@/components/Pagination'
import NavMenu from '@/components/NavMenu'
import Divider from '@/components/Divider'
import TagList from '@/components/TagList'
import PostHeader from '@/components/PostHeader'

export default {
  layout: "post",
  components: {
    PostHeader,
    Pagination,
    SiteFooter,
    NavMenu,
    Divider,
    TagList
  },
  async asyncData({ $content, params: { slug } }) {
    const articles = await $content('articles')
      .only(['title', 'teaser', 'date', 'cover', 'slug', 'author', 'tags'])
      .sortBy('createdAt', 'asc')
      .fetch()

    return {
      articles
    }
  },
  computed: {
    writingHeader() {
      return { title: 'My Writing', tags: []}
    }
  }
}
</script>
<style>
  .articles {
    @apply grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 grid-flow-row auto-rows-max gap-4;

    .article {
      background: whitesmoke;
      border-radius: 6px;
      @apply m-4 pb-2 text-lg leading-normal text-gray-700;

      img {
        width: 100%;
        height: 15rem;
      }

       h4 {
          @apply text-2xl;
        }

      .article-info {

      }
    }
  }
</style>
