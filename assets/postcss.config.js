module.exports = {
  plugins: [
    require('tailwindcss')('./tailwind.config.js'),
    require('postcss-plugin'),
    require('cssnano'),
    require('postcss-import'),
    require('autoprefixer'),
    require('postcss-nested'),
    require('postcss-simple-vars'),
    require('postcss-easing-gradients'),
    require('postcss-functions'),
  ]
}