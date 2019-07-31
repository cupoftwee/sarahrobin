<template>
    <nav class="absolute top-0 left-0 z-20 mt-8 ml-8">
      <g-link :to="{path}" class="nav-link block bg-transparent hover:bg-white text-md border-2 hover:no-underline text-white hover:text-pink-500 border-white font-bold text-center rounded-full px-6 py-2 pb-3">
        &larr; {{ label }}
      </g-link>
    </nav>
</template>

<script>
// TODO - support something other than glink
export default {
  props: {
    path: {
      type: String,
      default: '/'
    },
    label: {
      type: String,
      default: 'Home'
    }
  }
}
</script>
