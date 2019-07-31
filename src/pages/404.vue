<template>
  <DefaultLayout title="404 Page Not Found" mode="glass" :showNav="true" class="bg-rainbow border-t-glass-thin">
    <div class="flex items-center border-b-glass" style="height:90vh;">
      <div class="w-full sm:w-3/4 md:w-3/5 lg:w-2/5 max-w-xs mx-auto px-6 md:px-0 relative">
        <span class="absolute -mt-10 text-5xl inset-x-0 text-center pointer-events-none">
          🧐
        </span>

        <section class="bg-gray-100 mx-auto px-8 py-6 rounded shadow-xl relative">
          <h1 class="text-2xl font-sans font-black gradient-text mb-4">Page Not Found</h1>
          
          <p class="font-serif mb-4 leading-normal text-gray-700">
            Looks like you've followed a broken link or entered a URL that doesn't exist on this site.
          </p>
          
          <g-link to="/" class="nav-link text-md font-semibold link-pretty font-sans">
            &larr; Back to the magic ✨
          </g-link>
        </section>
      </div>
    </div>
  </DefaultLayout>
</template>

<script>
export default {
  metaInfo () {
    return { title: `Page Not Found (404)` }
  }
}
</script>

