<template>
  <div class="page-home bg-rainbow">
      <section class="page-home-splash b-glass container">
        <div class="splash-title">
          <h1 class="title-logotype display-sans sm:mt-12 md:mt-24 lg:mt-32">
            sarah robin
          </h1>

          <h2 class="title-subtitle text-5xl">
            Web Development
          </h2>
        </div>

        <ul class="home-nav max-w-xl">
          <li><NuxtLink to="/" class="nav-link">Home</NuxtLink></li>

          <li><NuxtLink to="/about" class="nav-link">About</NuxtLink></li>

          <li class="sm:visible lg:hidden break"></li>

          <li><NuxtLink to="/writing" class="nav-link">Writing</NuxtLink></li>

          <li><a href="#contact" class="nav-link">Contact</a></li>
        </ul>
      </section>

      <Divider direction="up" />

      <BriefBio teaser class="pt-6" />

      <div
       class="post-content width-screen bg-white mx-auto px-2 sm:px-12 pt-12"
       :class="'border-b-glass border-grey-lighter'"
      >
       <div class="mx-auto max-w-3xl xl:max-w-4xl px-8 md:px-12">
        <h1 class="text-6xl">My Work</h1>
        <p>A few choice cuts from my various professional endeavors</p>

        <div class="rainbow-rule" style="margin-bottom: 4rem;"></div>

        <ul class="work-list">
          <li
            v-for="project in projects"
            :key="project.url"
          >
            <ContentCard :content="project" />
          </li>
        </ul>

       </div>
     </div>

      <Divider direction="down" />

      <RecentContent :articles="articles" title="Writing" />
  </div>
</template>

<script>
import PostItem from '@/components/PostItem'
import NavMenu from '@/components/NavMenu'
import BriefBio from '@/components/Biography'
import Divider from '@/components/Divider'
import RecentContent from '@/components/RecentContent'
import ContentCard from '~/components/ContentCard.vue'

export default {
  layout: "home",
  components: {
    PostItem,
    NavMenu,
    BriefBio,
    Divider,
    RecentContent,
    ContentCard
  },

  async asyncData({ $content, params: { slug } }) {
    const articles = await $content('articles')
      .where({ tags: { $containsAny: 'portfolio' } })
      .only(['cover', 'title', 'description', 'slug', 'author', 'tags'])
      .limit(5)
      .sortBy('createdAt', 'asc')
      .fetch()

    const projects = await $content('work')
      .sortBy('createdAt', 'asc')
      .fetch()

    return { articles, projects }
  }
}
</script>

<style>
  .page-home {
    width: 100%;
    height: 100%;
  }

  .page-home-splash {
    height: 75vh;
    width: 100vw;
    position: relative;
    overscroll-behavior: contain;
    @apply mx-auto flex flex-col items-center content-around justify-around;
  }

  .home-nav {
    z-index: 9;
    @apply flex flex-wrap;
    @apply items-center content-around justify-around;

    @screen md {
      @apply mx-auto w-full pt-6;
    }

    li {
      @apply px-6 text-center;
    }

    a {
      @apply text-xl text-maxBright font-thin;
      @apply uppercase tracking-widest;
    }
  }

  .splash-title {
    text-align: center;
  }

  .splash-title .title-logotype {
    @apply text-maxBright;
    text-transform: uppercase;
    font-size: 4.5rem;
    letter-spacing: 0.25em;
  }

  .splash-title .title-subtitle {
    font-family: 'Crimson Text', serif;
    font-weight: 600;
    font-style: italic;
    word-spacing: 5px;
  }
</style>
