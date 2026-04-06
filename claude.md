 javascript-qunit-sinon session notes

## Repo relationships

This repo (`cyber-dojo-languages/javascript-qunit-sinon`) builds the Docker image.
The start-point files (source, tests, manifest) live in the partner repo:
`../../cyber-dojo-start-points/javascript-qunit-sinon`

Development loop:
1. Edit `docker/Dockerfile.base` here
2. Run `./pipe_build_up_test.sh` — builds image, prints new tag at the end
3. Update `image_name` in `../../cyber-dojo-start-points/javascript-qunit-sinon/start_point/manifest.json`
4. Edit start-point files in `../../cyber-dojo-start-points/javascript-qunit-sinon/start_point/`
5. Run `../../cyber-dojo-start-points/javascript-qunit-sinon/run_tests.sh` — verifies red/amber/green

**Important:** never run docker commands directly. Only test via `run_tests.sh`.
The runner containers have no internet access. The run_tests.sh script simulates three cyber-dojo [test] runs, once for red, once for amber, once for green, and prints a summary for each once that includes the duration. So you don't need to use the command time.

## Performance notes

In `cyber-dojo.sh`, call tool binaries directly via `node_modules/.bin/` instead of `npm run lint` / `npm run test`. This avoids npm startup overhead and gives ~4-5x speedup (from ~6s to ~1.4s per run).

```sh
node_modules/.bin/eslint --config ${CYBER_DOJO_SANDBOX}/eslint.config.js /**/*.js
node_modules/.bin/nyc node_modules/.bin/qunit-cli *test*.js
```

