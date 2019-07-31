<template>
  <DefaultLayout
    title="Writing" 
    mode="glass" 
    :showNav="true" 
    class="bg-rainbow bg-local border-t-glass-thin"
  >
    <post-header :post="$page.post" />

    <article 
      class="post-content width-screen bg-white mx-auto px-6 sm:px-12 pt-12"
      :class="{'border-b border-grey-lighter pb mb-16': !$page.post.author}"
    >
      <div class="mx-auto max-w-xl md:max-w-2xl xl:max-w-3xl px-8 md:px-12">
        <Alert v-if="postIsOlderThanOneYear" class="bg-orange-100 border-l-4 border-orange-500 text-orange-900">
          This post is over a year old, some of this information may be out of date.
        </Alert>

        <div 
          :class="{'pb-10': $page.post.author || $page.post.tags}" 
          class="markdown text-lg leading-normal text-gray-700" 
          v-html="$page.post.content" 
        />
      </div>
    </article>
    
    <section v-if="$page.post.author || $page.post.tags" class="width-screen">
      <div class="bg-white w-screen px-6 lg:px-24 pb-8 flex flex-wrap justify-center">
        <g-link 
          v-for="tag in $page.post.tags" 
          :key="tag.id" 
          :to="`${tag.path}/`" 
          class="text-pink-400 hover:text-white hover:bg-pink-400 border border-pink-400 font-sans font-bold text-xs sm:text-sm px-4 py-2 mr-4 mb-2 rounded-full transition-color transition-bg"
        >
          <svg class="inline w-3 fill-current align-middle mr-1" viewBox="0 0 20 20" role="img" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 10V2l2-2h8l10 10-10 10L0 10zm4.5-4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
          </svg>
          
          {{ tag.title }}
        </g-link>
      </div>
      
      <div v-if="$page.post.author" class="py-10 px-16 bg-transparent border-b-glass border-t-glass-thin flex flex-wrap items-center justify-center">
        <figure class="px-2 mb-1 sm:mb-0 flex justify-center hidden">
          <g-link :to="`${$page.post.author.path}/`">
            <g-image 
              src="/images/authors/sarah-robin.png" 
              :alt="$page.post.author.title" 
              @error="imageLoadError" 
              class="rounded-full border-transparent p-0 w-24"
            />
          </g-link>
        </figure>
        
        <div class="px-4 text-center lg:text-left hidden">
          <h4 class="font-sans font-bold text-2xl mb-2">
            <g-link :to="`${$page.post.author.path}/`" class="text-white hover:text-pink-400 capitalize border-b-2 border-transparent transition-color">
              {{ titleCase($page.post.author.title) }}
            </g-link>
          </h4>
          
          <p class="leading-normal hidden">
            <g-link :to="`${$page.post.author.path}/`" class="text-white nav-link transition-color">
              More about moi &rarr;
            </g-link>
          </p>
        </div>
      </div>
    </section>
    
  </DefaultLayout>
</template>

<script>
  import moment from 'moment'
  import config from '~/.temp/config.js'
  import Alert from '@/components/Alert'
  import slugify from '@sindresorhus/slugify'
  import SiteFooter from '@/components/FooterMenu'
  import PostHeader from '~/components/PostHeader'
  import Divider from '@/components/Divider'

  export default {
    components: {
      Alert,
      PostHeader,
      SiteFooter,
      Divider
    },

    metaInfo () {
      return {
        // title: `${this.$page.post.title} ${this.$page.post.tag ? '- '+this.$page.post.tag.name : ''}`,
        meta: [
          {
            key: 'description',
            name: 'description',
            content: this.description(this.$page.post)
          },
        ],
      }
    },

    mounted () {
      import('medium-zoom').then(mediumZoom => {
        this.zoom = mediumZoom.default('.markdown p > img')
      })
    },
    
    methods: {
      imageLoadError (e) {
        e.target.src = `/images/authors/default.png`
      },

      description(post, length, clamp) {
        if (post.description) {
          return post.description
        }

        length = length || 280
        clamp = clamp || ' ...'
        let text = post.content.replace(/<pre(.|\n)*?<\/pre>/gm, '').replace(/<[^>]+>/gm, '')

        return text.length > length ? `${ text.slice(0, length)}${clamp}` : text
      },

      titleCase(str) {
        return str.replace('-', ' ')
                  .split(' ')
                  .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
                  .join(' ')
      },
    },

    computed: {
      config () {
        return config
      },

      postIsOlderThanOneYear () {
        let postDate = moment(this.$page.post.datetime)
        
        return moment().diff(postDate, 'years') > 0 ? true : false
      },

      postUrl () {
        let siteUrl = this.config.siteUrl
        let postSlug = this.$page.post.slug

        return postSlug ? `${siteUrl}/${postSlug}/` : `${siteUrl}/${slugify(this.$page.post.title)}/`
      },
    },
  }
</script>

<style>
  .post-content {
    img {
      padding: 4px;
      border: 1px solid gainsboro;
      border-radius: 3px;
    }
    a {
      @include nav-link;
      color: palevioletred;
    }
  }
</style>


<page-query>
  query Post ($path: String) {
    post (path: $path) {
      title
      slug
      datetime: date (format: "YYYY-MM-DD HH:mm:ss")
      content
      description
      timeToRead
      cover
      author {
        id
        title
        path
      }
      tags {
        id
        title
        path
      }
    }
  }
</page-query>
