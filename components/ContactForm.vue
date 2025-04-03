<template>
  <div class="bg-gray-100">
    <form
      id="contact"
      action="https://usebasin.com/f/48307c1c809f"
      method="POST"
      class="w-3/4 md:w-1/2 mx-auto py-8 pb-12"
    >
      <h3 class="mb-8 text-3xl text-gray-700">Drop me a line!</h3>

      <div class="md:flex md:items-center mb-6">
        <div class="md:w-1/3">
          <label class="block text-gray-700 font-bold md:text-right mb-1 md:mb-0 pr-4" for="full-name">
            Full Name <span class="text-red-700 pl-1">*</span>
          </label>
        </div>

        <div class="md:w-2/3">
          <input
            id="full-name" name="full-name" required
            class="bg-gray-400 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
            type="text" placeholder="Firstname Surname"
          />
        </div>
      </div>

      <div class="md:flex md:items-center mb-6">
        <div class="md:w-1/3">
          <label class="block text-gray-700 font-bold md:text-right mb-1 md:mb-0 pr-4" for="username">
            Email <span class="text-red-700 pl-1">*</span>
          </label>
        </div>

        <div class="md:w-2/3">
          <input
            id="username" name="email" required
            class="bg-gray-400 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
            type="email" placeholder="you@example.com"
          />
        </div>
      </div>

      <div class="md:flex md:items-center mb-6">
        <div class="md:w-1/3">
          <label class="block text-gray-700 font-bold md:text-right mb-1 md:mb-0 pr-4" for="message">
            Message <span class="text-red-700 pl-1">*</span>
          </label>
        </div>

        <div class="md:w-2/3">
          <textarea
            id="message" name="message" required
            class="bg-gray-400 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
            placeholder="Type your message here"
          />
        </div>
      </div>

      <div class="md:flex md:items-center">
        <div class="md:w-1/3"></div>

        <div class="md:w-2/3">
          <button type="submit" class="w-full md:w-auto button text-md font-bold border-2 text-pink-500 border-pink-500 rounded-full px-6 py-3 mb-4 hover:no-underline hover:text-white hover:bg-pink-500 transition-bg">
            Say Hello!
          </button>
        </div>
      </div>
    </form>

    <div class="bg-gradient border-t-glass w-full pt-12 pb-6">
      <ul class="flex justify-center align-center mt-12">
        <!-- TBD - Fix issue w/ generation once I blog enough to warrant an RSS feed -->
        <!-- <li class="px-2 mb-2">
          <a href="/feed.xml" class="hover:text-pink-200 text-white">
            <fa-icon icon="rss" class="hover:no-underliner" />
            RSS feed
          </a>
        </li> -->

        <li class="px-2 mb-2">
          <a href="/sitemap.xml" class="hover:text-pink-200 nav-link  text-lg text-white font-bold shadow">
            <fa-icon icon="sitemap" class="hover:no-underline" />
            Site map
          </a>
        </li>
      </ul>

      <p class="text-white font-bold text-lg text-center w-full mx-auto shadow">
        &copy; Sarah Robin 2019 - 2023
      </p>
    </div>
  </div>
</template>

<script>
export default {

}
</script>
