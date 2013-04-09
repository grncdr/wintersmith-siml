# wintersmith-siml
> Compile SIML templates.

## Getting Started
This plugin requires Wintersmith.

Checkout [Wintersmith](http://jnordberg.github.io/wintersmith/), if you haven't before.

Checkout [SIML's introduction](https://github.com/padolsey/SIML/wiki/101---Introduction) for more information on [SIML](https://github.com/padolsey/SIML) itself.

```shell
npm install wintersmith-siml --save-dev
```

Once the Wintersmith Template Plugin has been installed, it may be enabled inside your `config.json` file by adding it to the `plugins` array:

```json
"plugins" : [ "./node_modules/wintersmith-siml" ]
```

If you've installed Wintersmith-SIML globally (through `npm install -g wintersmith-siml`), you don't need to specify a path:

```json
"plugins" : [ "wintersmith-siml" ]
```

Next, when you run `wintersmith build`, or `wintersmith preview`, files with `siml` as there extension will be rendered to HTML.

Alternativly, you could run `wintersmith build --plugins wintersmith-siml`
