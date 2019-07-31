<template>
  <DefaultLayout title="About Me" mode="sinebow" glassBorderB glassBorderT>
    <BriefBio class="border-b-8 border-gradient" />
  </DefaultLayout>
</template>

<script>
  import config from '~/.temp/config.js'
  import NavMenu from '@/components/NavMenu'
  import BriefBio from '@/components/Biography'

  export default {
    name: 'About',

    components: { NavMenu, BriefBio },

    metaInfo () {
      return {
        title: 'About Me | Sarah Robin Design & Dev',
        meta: [
          {
            key: 'description',
            name: 'description',
            content: 'All about the designer and web engineer, Sarah Robin'
          },
        ],
      }
    },

    computed: {
      config () {
        return config
      },
    },
  }
</script>
