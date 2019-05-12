var tailwindcss = require('tailwindcss')('./tailwind.config.js')

module.exports = {
  plugins: {
    tailwindcss,
    "postcss-plugin": {},
    "cssnano":{ preset: 'default' },
    "postcss-import": {},
    "autoprefixer": {},
    "postcss-nested": {},
    "postcss-simple-vars": {},
    "postcss-easing-gradients": {},
    "postcss-functions": {}
  }
}