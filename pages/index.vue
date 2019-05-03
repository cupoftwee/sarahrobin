<template>
  <div>
    <div ref="canvas" id="canvas"></div>
     <div class="page__home">


    <section class="home__splash">
      <h1 class="splash__title sans">
        sarah robin
      </h1>

      <h2 class="splash__subtitle">
        Design &amp; Engineering
      </h2>

      <!-- <div class="links">
        <a
          href="https://nuxtjs.org/"
          target="_blank"
          class="button--green"
        >Documentation</a>
        <a
          href="https://github.com/nuxt/nuxt.js"
          target="_blank"
          class="button--grey"
        >GitHub</a>
      </div> -->
    </section>
  </div>
  </div>
</template>

<script>
import chroma from 'chroma-js'

// constants
const DEFAULT_GRID_ITEM = { isAlive: false, deaths: 0 };
const DEFAULT_PALETTE = [
  'darkred', 'deeppink', 'lightyellow', 'lightgreen', 'teal'
];


export default {
  name: 'HomePage',

  data: () => ({
    safeToRender: false,
    renderTrigger: 0,
    iterations: 1,
    maxIterations: 500,
    cellSize: 10,
    cellShadowSize: 0,
    simWidth: 100,
    simHeight: 100,
    simRunning: false,
    palette: chroma.scale('RdPu'),
    grid: [],
  }),

  mounted () {
    console.log(`simWidth: ${window.innerWidth / this.cellSize} simHeight: ${window.innerHeight / this.cellSize}`)
    this.simWidth = window.innerWidth / this.cellSize
    this.simHeight = window.innerHeight / this.cellSize

    this.$refs.canvas.style.width = `${this.cellSize}px`;
    this.$refs.canvas.style.height = `${this.cellSize}px`;

    this.grid = this.createGrid()
    console.log('grid created', this.grid)

    for (let i = 0; i < this.maxIterations; i++) {
      this.stepGrid()
    }
    console.log('attempting to render')
    this.renderGridToBoxShadow()
    this.renderTrigger++
    this.$refs.canvas.className = 'ready';
  },

  methods: {
    getColor (cell, iterations) {
      const value = cell.deaths / iterations
      const scaledColor = this.palette(value)

      return scaledColor
    },

    checkNeighbor (x = 0, y = 0) {
      if (x >= 0 && y >= 0 && this.grid.length > y && this.grid[y].length > x) {
        const neighbor = this.grid[y][x]

        if (!!neighbor && neighbor.isAlive) {
          return 1
        }
      }

      return 0
    },

    getAliveNeighbors (x, y) {
      const neighbors = [
        [-1, -1],[0, -1], [1, -1],[-1, 0],[1, 0],[-1, 1],[0, 1],[1, 1],
      ]
      let i = 0

      neighbors.map((n) => {
        i = i + this.checkNeighbor(x + n[0], y + n[1]);
      })

      return i;
    },

    createGrid (opts = {}, currentGrid = []) {
      let gridData = []

      for (let y = 0; y < this.simHeight; y++) {
        let column = []

        for (let x = 0; x < this.simWidth; x++) {
          const defaultCellValue = {
            isAlive: (Math.random() < 0.71),
            deaths: 0
          }

          column.push(opts.override ? opts.override : defaultCellValue)
        }

        gridData.push(column)
      }

      return gridData
    },

    stepGrid () {
      let newData = this.createGrid({ override: DEFAULT_GRID_ITEM })

      for (let y = 0; y < this.grid.length; y++) {
        for (let x = 0; x < this.grid[y].length; x++) {
          const n = this.getAliveNeighbors(x, y)
          const { isAlive, deaths } = this.grid[y][x]

          if ((n === 2 && !!isAlive) || n === 3) {
            newData[y][x] = { isAlive: true, deaths }
          } else {
            newData[y][x] = { isAlive: false, deaths: deaths + 1 }
          }
        }
      }

      this.grid = newData
      this.iterations++
    },

    renderGridToBoxShadow () {
      console.log('render called on this.grid: ', this.grid)
      console.log('ref:', this.$refs.canvas)
      let boxshadows = []

      for (let y = 0; y < this.grid.length; y++) {
        for (let x = 0; x < this.grid[y].length; x++) {
          const width = x * this.cellSize
          const height = y * this.cellSize
          const cell = this.grid[y][x]

          if (cell) {
            const shadowColor = this.getColor(cell, this.iterations)
            const dimensions = `${width}px ${height}px `
            const shadow = `${this.cellShadowSize}px ${shadowColor}`

            boxshadows.push(`${dimensions} ${shadow}`)
          }
        }
      }

      const boxshadowFinal = boxshadows.join(",")

      this.$refs.canvas.style.boxShadow = boxshadowFinal;
      console.log('ref:', this.$refs.canvas.style)
    },
  }
}
</script>
<style>
#canvas {
  opacity: 0;
}
#canvas.ready {
  opacity: 1;
  transition: opacity 1s ease-in;
}
.page__home {
  min-height: 100vh;
  min-width: 100vw;
  background: none;
  display: flex;
  justify-content: center;
  align-items:flex-start;
  text-align: center;
}

.home__splash {
  background: none;
}

.splash__title {
  display: block;
  text-transform: uppercase;
  font-size: 64px;
  letter-spacing: 0.3em;
  margin-bottom: 0.2em;
  margin-top: 15vw;
}

.splash__subtitle {
  font-weight: 300;
  font-size: 48px;
  font-style: italic;
  word-spacing: 5px;
  padding-bottom: 15px;
}
</style>
