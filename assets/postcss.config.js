class TailwindExtractor {
  static extract(content) {
    return content.match(/[A-Za-z0-9-_:\/]+/g) || [];
  }
}

module.exports = ({ env }) => ({
  plugins: [
    require('postcss-import'),
    require('tailwindcss')('./tailwind.js'),
    env === 'production' &&
      require('@fullhuman/postcss-purgecss')({
        extractors: [
          {
            extractor: TailwindExtractor,
            extensions: ['html.eex'],
          },
        ],
        content: ['../lib/**/**/*.html.eex', './components/*.js'], // files to extract the selectors from
        css: ['css/app.css'], // css
      }),
    require('autoprefixer'),
  ],
});
