---
title: Submitting Changes to my .dotfiles upstream
author: Bennie
layout: post
permalink: /submitting-changes-to-my-dotfiles-upstream/
dsq_thread_id:
  - 2931042927
categories:
  - .dotfiles
  - Vim
tags:
  - dotfiles
  - learning
  - thoughtbot
  - vim
---
At work I have started to use Vim more often. In doing so I have adapted my coworker&#8217;s dotfiles repo (which is based off of thoughtbot&#8217;s dotfiles) and started using it for myself. I have forked it [here][1]. To install read the [README.md][2] or [thoughtbot&#8217;s install blog post][3].

I recently hit a problem with using these dotfiles in that I wanted to make some changes to my setup but still wanted to be able to contribute things back to my coworkers dotfiles. So, I started to do some research and was able to get ahold of [@r00k][4] and [@croaky][5] on Twitter and [@croaky][5] mapped me to this [blog post from thoughtbot][6].

It took me a little bit of thinking and trial and error but I have finally figured it out. So, here we go&#8230;

Lets clone your forked dotfiles repo down (replace <github_username> with your username):

{% highlight sh linenos %}
git clone git@github.com:<github_username>/dotfiles.git
{% endhighlight %}

Then we can add a remote called upstream, which will the repo that you forked yours from:

{% highlight sh linenos %}
cd dotfiles
git remote add upstream git@github.com:benniemosher/dotfiles
{% endhighlight %}

Now we are set. We can now update our master branch from our upstreams master branch:

{% highlight sh linenos %}
git fetch upstream
git rebase upstream/master
{% endhighlight %}

This will allow us to get any updates that our upstream repo pushes out. We can now change anything that we want in our forked dotfiles repo and push it to github. We can begin to personal our dotfiles and still be able to retrieve updates from our upstream repo.

Let&#8217;s say that you have wrote this amazing macro for your Vim setup and you want to push it out to your upstream repo.

Simply checkout your upstreams master branch under a branch named upstream:

{% highlight sh linenos %}
git co -b upstream upstream/master
{% endhighlight %}

This will remove all of your Vim customizations and set you back to your upstreams default. We can now make a change in the upstream branch, push it to github, and then make a pull request (PR) comparing our upstream branch to upstream/masters branch. This will allow you to push any customization that is worthy of being in the upstream repo up, and then create PRs of only those changes. Once the PR has been approved and merged into our upstream repo, we can update our local copy with those changes:

{% highlight sh linenos %}
git fetch upstream
git rebase upstream/master
{% endhighlight %}

We do a rebase here instead of a merge so that we can try to avoid as many conflicts as possible. This should take the commit in our upstream branch and replay it on top of all of our customizations. Now we just simply rinse and repeat!

Happy Viming!

[1]: https://github.com/benniemosher/dotfiles
[2]: https://github.com/benniemosher/dotfiles/blob/master/README.md
[3]: http://robots.thoughtbot.com/manage-team-and-personal-dotfiles-together-with-rcm
[4]: https://twitter.com/r00k
[5]: https://twitter.com/croaky
[6]: http://robots.thoughtbot.com/keeping-a-github-fork-updated
