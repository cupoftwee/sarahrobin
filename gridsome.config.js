class TailwindExtractor {
  static extract(content) {
    return content.match(/[A-Za-z0-9-_:\/]+/g) || [];
  }
}

const siteName = 'Sarah Robin | Design & Engineering';
const siteDescription = "Portfolio and professional services for Sarah Robin, a dev and designer based out of Northern CA";

module.exports = {
  siteName,
  siteDescription,
  siteUrl: 'https://www.sarahrobin.dev',
  titleTemplate: `%s | Sarah Robin`,
  icon: 'src/favicon.png',

  transformers: {
    remark: {
      externalLinksTarget: '_blank',
      externalLinksRel: ['nofollow', 'noopener', 'noreferrer'],
      plugins: [
        ['gridsome-plugin-remark-shiki', {
          theme: 'min-light'
        }]
      ]
    }
  },

  plugins: [
    {
      use: '@gridsome/source-filesystem',
      options: {
        path: 'content/published/**/*.md',
        typeName: 'Post',
        route: '/writing/:slug',
        refs: {
          tags: {
            typeName: 'Tag',
            route: '/writing/tag/:id',
            create: true
          },
          author: {
            typeName: 'Author',
            route: '/about',
            create: true
          }
        }
      }
    },
    // TODO: Analytics that aren't Google.
    // {
    //   use: '@gridsome/plugin-google-analytics',
    //   options: {
    //     id: 'UA-135446199-1'
    //   }
    // },
    {
      use: '@gridsome/plugin-sitemap',
      options: {
        cacheTime: 600000, // default
      }
    },
    {
      use: 'gridsome-plugin-rss',
      options: {
        contentTypeName: 'Post',
        feedOptions: {
          title: siteName,
          feed_url: 'https://sarahrobin.netlify.com/feed.xml',
          site_url: 'https://sarahrobin.netlify.com'
        },
        feedItemOptions: node => ({
          title: node.title,
          description: node.description,
          url: 'https://sarahrobin.netlify.com/' + node.slug,
          author: node.author,
          date: node.date
        }),
        output: {
          dir: './static',
          name: 'feed.xml'
        }
      }
    },
  ],

  chainWebpack: config => {
    config.module
      .rule('css')
      .oneOf('normal')
      .use('postcss-loader')
      .tap(options => {
        options.plugins.unshift(...[
          require('postcss-simple-vars'),
          require('postcss-import'),
          require('postcss-nested'),
          require('tailwindcss'),
          require('autoprefixer'),
        ])

        if (process.env.NODE_ENV === 'production') {
          options.plugins.push(...[
            require('@fullhuman/postcss-purgecss')({
              content: [
                'src/assets/**/*.css',
                'src/**/*.vue',
                'src/**/*.js'
              ],
              extractors: [
                {
                  extractor: TailwindExtractor,
                  extensions: ['css', 'vue', 'js']
                }
              ],
              whitelistPatterns: [/shiki/]
            }),
          ])
        }

        return options
      })
  },
}





