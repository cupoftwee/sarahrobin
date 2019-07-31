
import DefaultLayout from '~/layouts/DefaultLayout.vue'

// Font Awesome
import { library } from '@fortawesome/fontawesome-svg-core'
import { faHome, faBookDead, faLaptopCode, faFeather, faRss, faSitemap, faComments } from '@fortawesome/free-solid-svg-icons'
import { faDribbble, faGithubAlt, faMastodon, faLinkedin } from '@fortawesome/free-brands-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// TODO: There has to be a cleaner way to do this. Make some sort of plugin or somethin :?
library.add(faHome, faBookDead, faLaptopCode, faFeather, faRss, faSitemap, faDribbble, faGithubAlt, faMastodon, faLinkedin, faComments)

export default function (Vue, { head }) {
  Vue.component('FaIcon', FontAwesomeIcon)
  Vue.component('DefaultLayout', DefaultLayout)

  head.htmlAttrs = { lang: 'en', class: 'h-full' }
  head.bodyAttrs = { class: 'antialiased overflow-x-hidden' }

  // TODO: trim fonts to only the required minimum
  head.link.push({
    rel: 'stylesheet',
    href: 'https://fonts.googleapis.com/css?family=Crimson+Text:600i|Oswald:600|Fira+Sans:200,300,400,600,700'
  })
}
