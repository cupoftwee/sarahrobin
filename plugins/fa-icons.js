import Vue from 'vue';

// Font Awesome
import { library } from '@fortawesome/fontawesome-svg-core';
import { faHome, faBookDead, faLaptopCode, faFeather, faRss, faSitemap, faComments } from '@fortawesome/free-solid-svg-icons';
import { faDribbble, faGithubAlt, faMastodon, faLinkedin } from '@fortawesome/free-brands-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

library.add(faHome, faBookDead, faLaptopCode, faFeather, faRss, faSitemap, faDribbble, faGithubAlt, faMastodon, faLinkedin, faComments);

Vue.component('FaIcon', FontAwesomeIcon)
