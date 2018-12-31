const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

const webcomponentsjs = './node_modules/@webcomponents/webcomponentsjs';

const polyfills = [
  {
    from: path.resolve(`${webcomponentsjs}/webcomponents-*.{js,map}`),
    to: path.resolve(__dirname, '../priv/static/js/vendor'),
    flatten: true,
  },
  // {
  //   from: resolve(`${webcomponentsjs}/bundles/*.{js,map}`),
  //   to: join(OUTPUT_PATH, 'vendor', 'bundles'),
  //   flatten: true,
  // },
  // {
  //   from: path.resolve(`${webcomponentsjs}/custom-elements-es5-adapter.js`),
  //   to: path.resolve(__dirname, '../priv/static/js/vendor'),
  //   flatten: true,
  // },
];

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
      new OptimizeCSSAssetsPlugin({}),
    ],
  },
  entry: {
    app: ['./js/app.js'].concat(glob.sync('./vendor/**/*.js')),
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, '../priv/static/js'),
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: [/node_modules/],
        use: {
          loader: 'babel-loader',
        },
      },
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader'],
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({ filename: '../css/app.css' }),
    new CopyWebpackPlugin([{ from: 'static/', to: '../' }, ...polyfills]),
  ],
});
