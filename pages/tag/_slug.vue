<template>
  <div class="bg-rainbow">


    <div
      class="post-content width-screen bg-white mx-auto px-6 sm:px-12 pt-12"
      :class="'border-b border-grey-lighter pb mb-16'"
    >
      <div class="mx-auto max-w-xl md:max-w-2xl xl:max-w-3xl px-8 md:px-12">
        <h1>Posts tagged with #{{ slug }}</h1>

        <ul>
          <li class="pb-10 text-lg leading-normal text-gray-700" v-for="article of articles" :key="article.slug">
            <NuxtLink :to="{ name: 'blog-slug', params: { slug: article.slug } }">
              <img :src="article.cover" />
              <div>
                <h2>{{ article.title }}</h2>
                <p>by {{ article.author }}</p>
                <p>{{ article.description }}</p>
              </div>
            </NuxtLink>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    async asyncData({ $content, params: { slug } }) {
      const articles = await $content('articles')
        .where({ tags: { $containsAny: slug } })
        .only(['title', 'description', 'img', 'slug', 'author'])
        .sortBy('createdAt', 'asc')
        .fetch()

      return {
        articles,
        slug
      }
    }
    }
</script>
