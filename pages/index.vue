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

        <ul class="home-nav">
          <li><NuxtLink to="/" class="nav-link">Home</NuxtLink></li>

          <li><NuxtLink to="/about" class="nav-link">About</NuxtLink></li>

          <li class="sm:visible lg:hidden break"></li>

          <li><NuxtLink to="/work" class="nav-link">Work</NuxtLink></li>

          <li><NuxtLink to="/writing" class="nav-link">Writing</NuxtLink></li>

          <li class="sm:visible lg:hidden break"></li>

          <li><a href="#contact" class="nav-link">Contact</a></li>
        </ul>
      </section>

      <Divider direction="up" />

      <BriefBio teaser class="pt-6" />

      <Divider direction="down" />

      <RecentWork :articles="articles" />
  </div>
</template>

<script>
import PostItem from '@/components/PostItem'
import NavMenu from '@/components/NavMenu'
import BriefBio from '@/components/Biography'
import Divider from '@/components/Divider'
import RecentWork from '@/components/RecentWork'

export default {
  layout: "home",
  components: {
    PostItem,
    NavMenu,
    BriefBio,
    Divider,
    RecentWork
  },

  async asyncData({ $content, params: { slug } }) {
    const articles = await $content('articles')
      .where({ tags: { $containsAny: 'portfolio' } })
      .only(['cover', 'title', 'description','slug', 'author'])
      .sortBy('createdAt', 'asc')
      .fetch()

    return { articles }
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
