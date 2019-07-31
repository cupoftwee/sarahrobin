export default [
  {
    name: "404",
    path: "/404",
    component: () => import(/* webpackChunkName: "page--src-pages-404-vue" */ "C:\\Users\\Sarah\\Code\\garden\\sarahrobin\\src\\pages\\404.vue")
  },
  {
    name: "home",
    path: "/:page(\\d+)?",
    component: () => import(/* webpackChunkName: "page--src-pages-index-vue" */ "C:\\Users\\Sarah\\Code\\garden\\sarahrobin\\src\\pages\\Index.vue"),
    meta: {
      data: true
    }
  },
  {
    path: "/writing/:page(\\d+)?",
    component: () => import(/* webpackChunkName: "page--src-pages-writing-vue" */ "C:\\Users\\Sarah\\Code\\garden\\sarahrobin\\src\\pages\\Writing.vue"),
    meta: {
      data: true
    }
  },
  {
    path: "/about/:page(\\d+)?",
    component: () => import(/* webpackChunkName: "page--src-templates-author-vue" */ "C:\\Users\\Sarah\\Code\\garden\\sarahrobin\\src\\templates\\Author.vue"),
    meta: {
      data: true
    }
  },
  {
    path: "/writing/tag/:id/:page(\\d+)?",
    component: () => import(/* webpackChunkName: "page--src-templates-tag-vue" */ "C:\\Users\\Sarah\\Code\\garden\\sarahrobin\\src\\templates\\Tag.vue"),
    meta: {
      data: true
    }
  },
  {
    path: "/writing/:slug",
    component: () => import(/* webpackChunkName: "page--src-templates-post-vue" */ "C:\\Users\\Sarah\\Code\\garden\\sarahrobin\\src\\templates\\Post.vue"),
    meta: {
      data: true
    }
  },
  {
    name: "*",
    path: "*",
    component: () => import(/* webpackChunkName: "page--src-pages-404-vue" */ "C:\\Users\\Sarah\\Code\\garden\\sarahrobin\\src\\pages\\404.vue")
  }
]

