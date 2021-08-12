<template>
  <footer class="footer-menu bg-white border-t-glass p-10 md:p-16">
    <div class="w-full text-center md:text-left md:w-1/2 mb-4">
      <NuxtLink to="/" class="footer-logo link-pretty">
        <span class="font-bold">Sarah Robin </span> |
        Design &amp; Engineering
      </NuxtLink>
    </div>

    <div class="w-full px-0 md:w-1/2">
      <nav>
        <ul class="flex flex-wrap justify-around align-center py-4 px-4 mb-4 lg:justify-end lg:px-0">
          <li class="px-2 mb-0">
            <NuxtLink to="/" class="footer-link nav-link link-pretty hover:text-teal-400g">
              <fa-icon icon="home" />
              Home
            </NuxtLink>
          </li>

          <li class="px-2 mb-0">
            <NuxtLink to="about" class="footer-link nav-link link-pretty hover:text-blue-400">
              <fa-icon icon="laptop-code" />
              About
            </NuxtLink>
          </li>

          <li class="break mb-6 visible md:hidden"></li>

          <li class="pl-2 mb-0">
            <NuxtLink to="work" class="footer-link nav-link link-pretty hover:text-purple-400">
              <fa-icon icon="feather" />
              Work
            </NuxtLink>
          </li>

          <li class="break mb-6 visible md:hidden"></li>

          <li class="pl-2 mb-0">
            <NuxtLink to="writing" class="footer-link nav-link link-pretty hover:text-purple-400">
              <fa-icon icon="feather" />
              Writing
            </NuxtLink>
          </li>

          <li class="pl-2 mb-0">
            <a href="#contact" class="footer-link nav-link link-pretty hover:text-purple-400">
              <fa-icon icon="comments" />
              Contact
            </a>
          </li>
        </ul>
      </nav>

      <p class="text-center text-sm md:text-right">
        Built with
        <a href="https://gridsome.org" target="_blank" class="link-pretty text-sm font-bold">
          Gridsome
        </a>
        &amp;
        <a href="https://tailwindcss.com/" target="_blank" class="link-pretty text-sm font-bold">
          Tailwind CSS
        </a>
      </p>
    </div>
  </footer>
</template>

<script>
import { faGithub } from '@fortawesome/free-brands-svg-icons'

export default {
  name: 'Footer',
}
</script>

 <style>
    .footer-menu {
      overflow-x: hidden;
      @apply flex flex-wrap justify-around;
      @apply text-sm leading-normal;
      @apply w-screen py-8 py-8;

      .footer-logo {
        font-weight:400;

        @apply font-light text-lg no-underline;

        @screen md {
          @apply text-2xl;
        }
        @screen lg {
          @apply text-6xl;
        }
      }

      .footer-link {
        @apply font-bold transition-color transition-color;
        @apply text-base;

        &:hover {
          @apply no-underline;
        }

        @screen md {
          @apply text-lg;
        }
      }
    }

  .nav-link.link-pretty {

  }


 </style>
