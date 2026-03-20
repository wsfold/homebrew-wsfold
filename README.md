# homebrew-wsfold

Homebrew tap for installing `wsfold` from prebuilt GitHub release binaries.

## Install

```bash
brew tap wsfold/wsfold
brew install wsfold
```

This tap expects release artifacts to be published in:

- `https://github.com/wsfold/wsfold/releases`

## Repository Layout

```text
Formula/
  wsfold.rb
```

## Release Update Flow

After publishing a new release in `wsfold/wsfold`:

1. Update `version` in `Formula/wsfold.rb`
2. Update the 4 platform URLs if naming changed
3. Replace the 4 placeholder `sha256` values with the real values from `checksums.txt`
4. Commit and push the tap repo

## Note

Before the first public release exists, `Formula/wsfold.rb` is a bootstrap formula wired for `v0.0.1` with placeholder checksums. Replace those checksums after the first release is published.
