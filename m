From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: When will nouveau kernel tree be merged into master
Date: Thu, 9 Jul 2009 19:30:53 +0300
Message-ID: <20090709193053.5a5d6430@daedalus.pq.iki.fi>
References: <4A55DBDD.6030703@Free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A55DBDD.6030703-rC/V9kRXU7Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Eric.Valette-rC/V9kRXU7Q@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 09 Jul 2009 14:00:29 +0200
Eric Valette <Eric.Valette-rC/V9kRXU7Q@public.gmane.org> wrote:

> I've been using nouveau driveau for 8 months or so, using automated
> build from drm git, xf86-video-nouveau git and even sometimes mesa drm
> git  and discovered the linux-core build did not build the nouveau
> driver the hard way: X was refusing to start as the nouveau.ko modules
> was not loaded nor build. Build process did chnage without obvious way
> to know womething was wrong.

Nouveau was removed from make targets, therefore you get this:

$ make nouveau.o
make: *** No rule to make target `nouveau.o'.  Stop.

The removal was done in a commit, that removed the old ttm code, and at
the same time broke the nouveau.ko build, hence nouveau is not a target
anymore.

The plain 'make' of course works, since there are other modules that
(supposedly) still work.

Btw. Nouveau should fall back to NoAccel mode, if the kernel modules are
not available.

> Then I tried to build it by hand as the nouveau directory is still there
> but compilation fails! I wonder why the code is still in the tree as it
> make me waste quite some time trying to find where the missing
> definitions had gone.

The nouveau directory?

> After some hours of goggling I discovered there was an git kernel tree
> for nouveau. Got the feeling from dri-devel posts it was supposed to be
> merged for rc1, checked master tree and found it was not merged.

I assume you refer to the discussion
http://lists.freedesktop.org/archives/nouveau/2009-June/003103.html

The only merge mentioned is newTTM, which went into -rc1 along with
the radeon KMS driver. Nouveau depends on newTTM, and we wanted it
upstream before setting up the master branch.

> So my question are:
>     - Why not purely delete nouveau files from linux-core and issue
> error messages?

The code is still in the tree for historical reference, and for BSDs.
I'm not sure if BSDs still need it.

>     - When will nouveau in kernel git tree be merged? I know the merge
> windows is closed but that usually does not hold for new drivers

This Nouveau kernel tree will never be merged from. A completely
separate git repository will be created for upstreaming Nouveau.
A proposition was made in
http://lists.freedesktop.org/archives/nouveau/2009-March/002765.html
and we are approximately following that. The precise development
model is still under discussion and has to be decided before
creating the upstreaming tree.

There's a good chance the upstreaming tree is created this year, and
Nouveau starts its journey into mainline, but first into staging.

> Thanks. Using nouveau is quite painfull. Please be aware that as
> distribution move too slowly into nominal nouveau driver support, I'm
> not probably the only guy lost in the dust.

Yes, and we are trying to alleviate the pain by keeping the guides
in the wiki up-to-date. Granted, there were the few days, when drm.git
nouveau.ko build was broken, and the InstallDRM page was not written
yet, nor InstallNouveau updated. IIRC that was less than a week.

Unfortunately, some people want to translate wiki pages to their
mother tongue, and then do not bother updating them for a long time.
The English pages contain the latest information.

This is the original announcement:
http://lists.freedesktop.org/archives/nouveau/2009-June/003000.html
later we got master and master-compat branches up and deprecated
everything else. For further info, see
http://lists.freedesktop.org/archives/nouveau/2009-June/003134.html
http://lists.freedesktop.org/archives/nouveau/2009-July/003148.html
and the Nouveau wiki.

The nouveau kernel tree was annouced on the wiki front page, and on
the nouveau mailing list. What more should we have done?

-- 
Pekka Paalanen
http://www.iki.fi/pq/
