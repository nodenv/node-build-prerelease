# node-build-prerelease

[![Build Status](https://travis-ci.org/nodenv/node-build-prerelease.svg?branch=master)](https://travis-ci.org/nodenv/node-build-prerelease)

node-build-prerelease is an [nodenv][] plugin (or more precisely, a [node-build][] plugin) that provides build definitions for Node.js prereleases (primarily release candidates).

<!-- toc -->

- [Installation](#installation)
  - [Installing with Homebrew (for macOS users)](#installing-with-homebrew-for-macos-users)
  - [Installing via git-clone](#installing-via-git-clone)
  - [Installing via npm](#installing-via-npm)
  - [Installing manually](#installing-manually)
- [Usage](#usage)
  - [Setting NODE_BUILD_DEFINITIONS](#setting-node_build_definitions)
  - [Passing build definition directly](#passing-build-definition-directly)

<!-- tocstop -->

## Installation

### Installing with Homebrew (for macOS users)

MacOS users can install node-build-prerelease with the [Homebrew][].
Installing via Homebrew will make node-build aware of Node.js prereleases automatically.

_This is the recommended method of installation if you installed nodenv or node-build with Homebrew._

    brew install nodenv/nodenv/node-build-prerelease

There is the added delay between when a new version of node-build-prerelease is released, and when the Homebrew formula is updated to point to it.
Typically this additional delay is only a matter of days and is well worth the simplicity of using Homebrew to manage nodenv plugins.

(And if you _really_ want to be on the bleeding edge of node-build, you can skip waiting on node-build/node-build-prerelease to update and scrape new node releases yourself with [node-build-update-defs][].)

### Installing via git-clone

Installing node-build-prerelease as a nodenv plugin will make node-build aware of the prerelease build definitions automatically.

    git clone https://github.com/nodenv/node-build-prerelease.git $(nodenv root)/plugins/node-build-prerelease

This will install the latest development version of node-build-prerelease into the `$(nodenv root)/plugins/node-build-prerelease` directory.
From that directory, you can also check out a specific release tag.
To update node-build-prerelease, run `git pull` to download the latest changes or use [nodenv-update][].

### Installing via npm

Installing via npm is possible, though not really recommended.
Keep in mind that there is the risk you are installing a nodenv plugin into a node that is itself managed by nodenv.

    npm install -g @nodenv/node-build-prerelease

After installing, node-build will need to be made aware of the new build definitions.
see [setting node_build_definitions][]

### Installing manually

For precise control over the installation, you can install it manually.

    git clone https://github.com/nodenv/node-build-prerelease.git
    cd node-build-prerelease
    ./install.sh

This will install node-build-prerelease into `/usr/local`.
If you do not have write permission to `/usr/local`, you will need to run `sudo ./install.sh` instead.
You can install to a different prefix by setting the `PREFIX` environment variable.
(Be aware, if you install to a prefix other than that which node-build is installed, you will need to manually set `NODE_BUILD_DEFINITIONS`.)

To update node-build-prerelease after it has been installed, run `git pull` in your cloned copy of the repository, then re-run the install script.
After installing, node-build will need to be made aware of the new build definitions.
see [setting node_build_definitions][]

## Usage

If installed via Homebrew, as a nodenv plugin, or manually using the same `PREFIX` as node-build, then node-build should automatically be aware of the new prerelease build definitions.
Verify by running `nodenv install --list` to see if it includes the release candidate builds. (e.g. 8.0.0-rc.2)

Otherwise, node-build will need to be made aware of the new build definitions manually.

### Setting NODE_BUILD_DEFINITIONS

`NODE_BUILD_DEFINITIONS` is a colon-separated list of paths that include build definitions.

This is done by adding `/path/to/node-build-prerelease/share/node-build` to the `NODE_BUILD_DEFINITIONS` variable.
You can add node-build-prerelease's share path to it in your `.bashrc`:

    export NODE_BUILD_DEFINITIONS=$NODE_BUILD_DEFINITIONS:/path/to/node-build-prerelease/share/node-build

Or add it only when necessary:

    NODE_BUILD_DEFINITIONS=$NODE_BUILD_DEFINITIONS:/path/to/node-build-prerelease/share/node-build nodenv install --list

Either way, you'll need to know the exact location of where node-build-prerelease was installed.
If installed globally via a nodenv-managed npm, it would look something like:
`$(nodenv prefix)/lib/node_modules/@nodenv/node-build-prerelease/share/node-build`.
If installed manually to `PREFIX=/some/path`, it would look something like:
`/some/path/share/node-build`.

### Passing build definition directly

Both `nodenv install` and `node-build` accept a path to a custom definition file in place of a version name.

    nodenv install /path/to/node-build-prerelease/share/node-build/8.0.0-rc.2

Or:

    node-build /path/to/node-build-prerelease/share/node-build/8.0.0-rc.2 /dest/path/8.0.0-rc.2

[homebrew]: http://brew.sh
[nodenv]: https://github.com/nodenv/nodenv
[node-build]: https://github.com/nodenv/node-build
[nodenv-update]: https://github.com/nodenv/nodenv-update
[node-build-update-defs]: https://github.com/nodenv/node-build-update-defs
[setting node_build_definitions]: #setting-node_build_definitions
