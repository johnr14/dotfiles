
chezmoi - dotfiles : private
===========

This is an empty branch to prevent accidental commits of private data to my github public dotfiles.

I have enabled push protection so it won't be triggered by accident.

Based of [ralish](https://lobste.rs/s/nbdkuf/if_you_have_public_dotfiles_repo_do_you)'s post on how he manage two repositories.

<blockquote>
I ultimately settled on simply having two repositories, configured in a single local repository as two remotes. It’s a bit of a kludge, but it seems to work reasonably well. There’s two branches, which each point to a branch of the same name on different remotes:

  main    fe1b2870 [github/main] Update oh-my-zsh submodule to latest sources
* private 61f43032 [nexiom/private] Update oh-my-zsh submodule to latest sources

In my case I use different Git servers as well, but it could be the same Git server hosting two repositories, one with tighter access control. As a precaution, I also have a private branch on the “public” repository with a single commit and force push protection to avoid accidentally pushing the private branch to a branch of the same name on the “public” remote.

The only other thing to keep in mind is inevitably the branches have different history as the private branch is a superset of the commits on the public branch. Even that’s not technically true, as there’s some cases where files actually have different content beyond a mere subset of content (e.g. different .gitignore files). In the interests of keeping each branch history clean, I’ve settled on just cherry-picking relevant commits into the “public” branch:

> git rev-list --count main
1803
> git rev-list --count private
2118

Suffice to say, I’ve spent way too much time over the years curating my dotfiles.
</blockquote>

Create an empty branch with
`git branch --orphan private`

Commit a README.md and push it.

Then [lock branch](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches#lock-branch)

After return to `main` branch, add new remote for private branch and remove old.


