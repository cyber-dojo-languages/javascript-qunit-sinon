javascript-qunit-sinon session notes

## Repo relationships

Read https://github.com/cyber-dojo/cyber-dojo/blob/master/docs/how-to-contribute-to-start-points.md
This repo builds the Docker image.
The start-point files (source, tests, manifest) live in the repo in
`../../cyber-dojo-start-points/javascript-jest`

## Development loop
In this repo:
1. Edit `docker/Dockerfile.base` here
2. Run `./pipe_build_up_test.sh` — builds image, prints new tag at the end
In the start-points repo:
3. Update `image_name` in `start_point/manifest.json`
4. Edit start-point files in `start_point/`
5. Run `run_tests.sh` — verifies red/amber/green

**Important:** 
Never run docker commands directly. 
Only test via `run_tests.sh` (in which the runner containers have no internet access)
The run_tests.sh script simulates three cyber-dojo [test] runs, once for red, once for amber, once for green, and prints a summary for each once that includes the duration. So you don't need to use the `time` command.

## Performance notes

In `cyber-dojo.sh`, call tool binaries directly via `node_modules/.bin/` instead of `npm run lint` / `npm run test`. This avoids npm startup overhead and gives ~4-5x speedup (from ~6s to ~1.4s per run).

```sh
node_modules/.bin/eslint --config ${CYBER_DOJO_SANDBOX}/eslint.config.js /**/*.js
node_modules/.bin/nyc node_modules/.bin/qunit-cli *test*.js
```

