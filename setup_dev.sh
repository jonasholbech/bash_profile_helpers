#usage: setupDev "myProjectName"
#or: setupDev "myProjectName" connectToGithub
#second use requires the iamawesome script

# Todo read if not $1
# TODO: add import "babel-polyfill" to index?
# TODO: add xstate as argument?
setupDev ()
{
  mkdir "$1"
  cd "$1"
  echo "{
  \"plugins\": [\"@babel/plugin-transform-runtime\"]
}" > .babelrc
  npm init -y
  npm install --save-dev parcel-bundler
  npm install -save-dev gh-pages
  npm install --save-dev @babel/plugin-transform-runtime
  npm install --save @babel/runtime
  npm install --save-dev parcel-plugin-static-files-copy
  
  npm install --save-dev eslint eslint-config-prettier eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard
echo '{
      "env": {
        "browser": true,
        "es6": true
      },
      "extends": ["standard", "prettier"],
      "globals": {
        "Atomics": "readonly",
        "SharedArrayBuffer": "readonly"
      },
      "parserOptions": {
        "ecmaVersion": 2018,
        "sourceType": "module"
      },
      "rules": {}
    }' >.eslintrc.json
  
  npx npe scripts.start "parcel index.html --open"
  npx npe scripts.build "parcel build index.html --public-url ."
  npx npe scripts.deploy "npm run build && gh-pages -d dist"
  touch index.js
  mkdir static
  echo "<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"UTF-8\" />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
    <title>$1</title>
    <link rel=\"stylesheet\" href=\"index.css\" />
  </head>
  <body>
    <script src=\"index.js\"></script>
  </body>
</html>" > index.html
echo "body {
        font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto,
          Oxygen-Sans, Ubuntu, Cantarell, \"Helvetica Neue\", sans-serif;
      }
      img {
        max-width: 100%;
        height: auto;
      }
      body,
      html {
        margin: 0;
      }
      body {
        display: grid;
        grid-template-columns: 1fr;
      }
      .full-bleed {
        width: 100%;
      }
      nav {
        display: flex;
        flex-direction: column;
      }
      @media (min-width: 65ch) {
        body {
          grid-template-columns: 1fr 65ch 1fr;
        }
        body > * {
          grid-column: 2;
        }
        .full-bleed {
          grid-column: 1/4;
        }
        nav {
          flex-direction: row;
          justify-content: space-around;
        }
        .full-bleed.cut-off {
          height: 200px;
          object-fit: cover;
        }
      }" > index.css
  echo "node_modules/
.vscode/  
dist/
.cache/" > .gitignore
echo "# $1" > README.md
code .
connectToGit=${2:-false}
  if [[ "$connectToGit" = "connectToGithub" ]];
  then
      iamawesome
      echo "Add project to GitHub"
  else
      echo "Was told not to connect to github"
  fi
}