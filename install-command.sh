if [ ! -e "package.json" ]; then
  echo -n "project name?":
  read name
  touch "package.json"
  echo "package.jsonの初期化"
  echo "{" >> package.json
  echo "\"name\": \"$name\"," >> package.json
  echo "\"version\": \"1.0.0\"," >> package.json
  echo "}" >> package.json
fi
echo "webpackの導入"
npm install webpack webpack-cli
echo "fseventsのアップデート"
npm i fsevents
echo "ディレクトリとルートファイルの作成"
mkdir src/
touch src/index.tsx

echo "TypeScriptの導入"
npm i typescript

if [ ! -e "tsconfig.json" ]; then
  echo "tsconfig.jsonの初期化"
  touch tsconfig.json
	echo "{"                                >> tsconfig.json
	echo "  \"compilerOptions\": {"           >> tsconfig.json
	echo "    \"moduleResolution\": \"node\","  >> tsconfig.json
	echo "    \"outDir\": \"./dist/\","         >> tsconfig.json
	echo "    \"target\": \"ES2015\","           >> tsconfig.json
	echo "    \"jsx\": \"react\""           >> tsconfig.json
	echo "   }"                             >> tsconfig.json
	echo "}"                                >> tsconfig.json
fi

echo "webpackでTypeScriptをできるように設定"
npm i ts-loader

echo "reactの導入"
npm i react react-dom @types/react @types/react-dom

echo "ローカルサーバー"
npm i webpack-dev-server

if [ ! -e webpack.config.js ]; then
touch webpack.config.js
  echo "webpack.config.jsの設定"

  echo "const path = require(\"path\")" > webpack.config.js
  echo ""                             >> webpack.config.js
  echo "module.exports = {"           >> webpack.config.js
  echo "  entry: \"./src/index.tsx\","   >> webpack.config.js
	echo "  module: {" >> webpack.config.js
	echo "    rules: [" >> webpack.config.js
	echo "      {" >> webpack.config.js
	echo "        test: /\.tsx?$/," >> webpack.config.js
	echo "        use: 'ts-loader'," >> webpack.config.js
	echo "        exclude: /node_modules/," >> webpack.config.js
	echo "      }," >> webpack.config.js
	echo "    ]," >> webpack.config.js
	echo "  }," >> webpack.config.js
	echo "  resolve: {" >> webpack.config.js
	echo "    extensions: ['.js', '.ts', '.tsx']," >> webpack.config.js
	echo "  }," >> webpack.config.js
  echo "  output: {"                  >> webpack.config.js
  echo "    path: path.resolve(__dirname, \"dist\")," >> webpack.config.js
  echo "    filename: \"index.js\","    >> webpack.config.js
  echo "    publicPath: \"dist/\","     >> webpack.config.js
  echo "  },"                          >> webpack.config.js
	echo "  devServer:{" >> webpack.config.js
	echo "    hot: true," >> webpack.config.js
	echo "    open: true," >> webpack.config.js
	echo "  }" >> webpack.config.js
  echo "}"                            >> webpack.config.js
fi

