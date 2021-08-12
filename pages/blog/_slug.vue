<template>
  <div class="bg-rainbow">
    <PostHeader :post="article" />

    <article
      class="post-content width-screen bg-white mx-auto px-6 sm:px-12 pt-12"
      :class="{ 'border-b border-grey-lighter pb mb-16': !article.author }"
    >
      <div class="mx-auto max-w-xl md:max-w-2xl xl:max-w-3xl px-8 md:px-12">

        <div
          :class="{'pb-10': article.author || article.tags}"
          class="markdown text-lg leading-normal text-gray-700"
          v-html="article.content"
        />
        <nuxt-content
          class="markdown text-lg leading-normal text-gray-700"
          :class="{'pb-10': article.author || article.tags}"
          :document="article"
        />
      </div>
    </article>





  </div>
</template>
<script>
  import PostHeader from '@/components/PostHeader'
  import Divider from '@/components/Divider'

  export default {
    layout: 'post',

    components: {
      PostHeader,
      Divider
    },

    async asyncData({ $content, params }) {
      const article = await $content('articles', params.slug).fetch();

      return { article };
    },

    methods: {
      imageLoadError (e) {
        e.target.src = `/images/authors/default.png`
      },
      titleCase(str = "") {
        return str.replace('-', ' ')
                  .split(' ')
                  .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
                  .join(' ')
      },
    },

    computed: {
      postUrl() {
        let siteUrl = this.config.siteUrl
        let postSlug = this.$page.post.slug

        return postSlug ? `${siteUrl}/${postSlug}/` : `${siteUrl}/${slugify(this.$page.post.title)}/`
      }
    }
  }
</script>
