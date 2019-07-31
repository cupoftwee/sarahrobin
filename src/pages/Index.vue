<template>
  <DefaultLayout hideNav class="page-home bg-rainbow">
      <section class="page-home-splash b-glass container">
        <div class="splash-title">
          <h1 class="title-logotype display-sans sm:mt-12 md:mt-24 lg:mt-32">
            sarah robin
          </h1>

          <h2 class="title-subtitle text-5xl">
            Design &amp; Engineering
          </h2>
        </div>

        <ul class="home-nav">
          <li><g-link to="/" class="nav-link">Home</g-link></li>

          <li><g-link to="/about" class="nav-link">About</g-link></li>

          <li class="sm:visible lg:hidden break"></li>

          <li><g-link to="/writing" class="nav-link">Writing</g-link></li>
          
          <li><a href="#contact" class="nav-link">Contact</a></li>
        </ul>
      </section>

      <Divider direction="up" />

      <BriefBio teaser class="pt-6" />

      <Divider direction="down" />

      <RecentWork :posts="$page.posts" />
  </DefaultLayout>
</template>

<script>
import config from '~/.temp/config.js'

import PostItem from '@/components/PostItem'
import NavMenu from '@/components/NavMenu'
import BriefBio from '@/components/Biography'
import Divider from '@/components/Divider'
import RecentWork from '@/templates/RecentWork'

export default {
  components: {
    PostItem,
    NavMenu,
    BriefBio,
    Divider,
    RecentWork
  },

  metaInfo () {
    return {
      title: this.config.siteName,
    }
  },

  computed: {
    config () {
      return config
    }
  },
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

<page-query>
  query RecentWork ($page: Int) {
    posts: allPost (page: $page, perPage: 3, sortBy: "date", filter:{ tags:{ contains:"Portfolio" } }) @paginate {
      totalCount
      pageInfo {
        totalPages
        currentPage
      }
      edges {
        node {
          id
          title
          datetime: date (format: "YYYY-MM-DD HH:mm:ss")
          content
          excerpt
          description
          path
          cover
          tags {
            id
            title
            path
          }
          author {
            id
            title
            path
          }
        }
      }
    }
  }
</page-query>
