<template>
  <nav :class="{ ...bgClasses, ...borderClasses }" class="narrow flex items-center justify-between flex-wrap p-6 lg:px-20">
    <div class="flex items-center flex-shrink-0 mr-6">
      <h1 :class="textColorClasses" class="font-light text-left">
        <NuxtLink to="/" class="s no-underline text-2xl mb-0">
          <span class="font-bold">Sarah Robin </span>
          <span :class="{ 'hidden': !title }">| {{ title }}</span>
        </NuxtLink>
      </h1>
    </div>

    <div class="block lg:hidden" style="margin-top: 9px;">
      <button
        @click="toggleMenu"
        :class="{ ...borderClasses, ...textColorClasses }"
        class="flex items-center px-3 py-2 rounded border-2 hover:text-pink hover:border-pink"
      >
        <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <title>Menu</title>

          <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/>
        </svg>
      </button>
    </div>

    <div :class="{ 'hidden': !drawerOpen }" class="w-full block lg:flex md:items-right lg:w-auto">
      <div class="text-sm lg:flex-grow">
        <NuxtLink to="/" class="nav-link block text-white font-bold mt-4 mr-4 hover:no-underline lg:inline-block lg:mt-0">
          <fa-icon icon="home" class="" />
          Home
        </NuxtLink>

        <NuxtLink to="/about" class="nav-link block text-white font-bold mt-4 mr-4 hover:no-underline lg:inline-block lg:mt-0">
          <fa-icon icon="book-dead" class="" />
          About
        </NuxtLink>

        <NuxtLink to="/work" class="nav-link block text-white font-bold mr-4 mt-4 hover:no-underline lg:inline-block lg:mt-0">
          <fa-icon icon="laptop-code" class="" />
          Work
        </NuxtLink>

        <NuxtLink to="/writing" class="nav-link block font-bold text-white mt-4 mr-4 hover:no-underline lg:inline-block lg:mt-0">
          <fa-icon icon="feather" class="" />
          Writing
        </NuxtLink>

        <a href="#contact" class="nav-link block font-bold text-white mt-4 hover:no-underline lg:inline-block lg:mt-0 text-white">
          <fa-icon icon="comments" class="" />
          Contact
        </a>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'NavMenu',

  props: {
    title: {
      type: String,
      default: 'Web Development'
    },

    mode: {
      validator: (v) => ['glass', 'rainbow', 'sinebow', 'opaque'].indexOf(v) !== -1,
      default: 'opaque'
    },

    glassBorderB: { type: Boolean, default: true },
    glassBorderT: { type: Boolean, default: true },
  },

  data() {
    return {
      drawerOpen: false,
    }
  },

  computed: {
    bgClasses() {
      return {
        'border-t-glass-thin': this.glassBorderT,
        'border-b-glass-thin': this.glassBorderB,
        'bg-transparent': this.mode === 'glass',
        'bg-gradient': this.mode === 'sinebow',
        'bg-rainbow': this.mode === 'rainbow',
        'bg-white border-gradient border-b-8': this.mode === 'opaque'
      }
    },

    borderClasses() {
      const isSinebowOrRainbow = this.mode === 'sinebow' || this.mode === 'rainbow';

      return {
        //'border-b-glass-thin': isSinebowOrRainbow,
        'border-white': this.mode !=='opaque',
        'border-pink-500': this.mode === 'opaque'
      }
    },

    textColorClasses() {
      return {
        'text-white': this.mode !== 'opaque',
        'text-purple-500': this.mode ==='opaque'
      }
    }
  },

  methods: {
    toggleMenu() {
      this.drawerOpen = !this.drawerOpen
    }
  }
}
</script>
