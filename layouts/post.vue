<template>
  <div class="layout">
    <NavMenu
      v-if="!hideNav"
      :title="title"
      mode="glass"
      :glassBorderB="false"
      :glassBorderT="false"
    />

    <main role="main">
      <Nuxt />
    </main>

    <FooterMenu class="bg-white" />

    <ContactForm class="border-t-glass" />
  </div>
</template>

<script>
import NavMenu from '@/components/NavMenu'
import FooterMenu from '@/components/FooterMenu'
import ContactForm from '@/components/ContactForm'

export default {
  components: { FooterMenu, ContactForm, NavMenu },

  props: {
    hideNav: Boolean,
    default: false,

    title: {
      type: String,
      default: ''
    },

    glassBorderB: Boolean,
    glassBorderT: Boolean,

    head() {
      return {
        htmlAttrs: {
          lang: 'en',
          class: 'h-full'
        },
        bodyAttrs: {
          class: 'antialiased overflow-x-hidden'
        }
      }
  },

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
}
</script>
