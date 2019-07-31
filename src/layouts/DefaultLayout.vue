<template>
  <div class="layout">
    <NavMenu 
      v-if="!hideNav"
      :title="title" 
      :mode="mode" 
      :glassBorderB="glassBorderB" 
      :glassBorderT="glassBorderT" 
    />

    <main role="main">
      <slot />
    </main>

    <FooterMenu class="bg-white" />

    <ContactForm class="border-t-glass" />
  </div>
</template>

<script>
import config from '~/.temp/config.js'
import NavMenu from '@/components/NavMenu'
import FooterMenu from '@/components/FooterMenu'
import ContactForm from '@/components/ContactForm'

export default {
  components: { FooterMenu, ContactForm, NavMenu },

  props: {
    hideNav: Boolean,

    title: {
      type: String,
      default: ''
    },

    glassBorderB: Boolean,
    glassBorderT: Boolean,

    // TODO - this code is a repeat of NavMenu's types
    // Should consolidate there, or even better move to typescript
    // Also, it keeps breaking the nav :/
    mode: {
      // validator: (v) => ['glass', 'rainbow', 'sinebow', 'opaque'].indexOf(v) !== -1,
      default: 'glass'
    },

    showFooter: {
      type: Boolean,
      default: true,
    }
  },

  computed: {
    config () {
      return config
    }
  }
}
</script>

<style src="~/assets/css/main.css"></style>
