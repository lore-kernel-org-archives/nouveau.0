From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: DRM and the Nouveau kernel tree
Date: Mon, 29 Jun 2009 23:14:36 +0300
Message-ID: <20090629231436.3eebdfa0@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I think it is safe to say, that the drm.git Nouveau kernel modules are
now abandoned. The build has been broken for several days. The replacement
is the Nouveau kernel tree. I have been updating the instructions in the
wiki, so you should get all the information there.

The InstallDRM guide should now be complete, there are even *small* daily
snapshots for people who fear 'git clone' ;-)

I updated InstallNouveau, but I have not touched any of the special
guides for various distributions. I hope the authors or users of those
guides will update them as needed.

Currently the kernel tree has three branches:
- master
- newttm-devel
- newttm-devel-compat

There should also be a master-compat, that comes when someone has the
time to create it.

Master branch is currently "recommended", but it won't build against
anything before 2.6.31-rc1, and that -rc1 was (so I hear) quite buggy.
Waiting for -rc2 might be good.

Newttm-devel is an older experiment with a kernel tree, but it should
still work with 2.6.30. If you have an earlier kernel, you may have
to use the newttm-devel-compat branch, which contains compatibility
patches to build against 2.6.28 - 2.6.30. These won't build with
2.6.31-rc1 or later.

Newttm-devel branches are being phased out, and in the future
master branch is *the* branch. Or master-compat, if you have an
older kernel and need a compatibility patched version.

Is Nouveau going into mainline soon?
Not soon, but I can only guess. Most likely Nouveau will go into
staging first, which means it doesn't have to have a completely
frozen user ABI, but there has to be "a plan to get out of staging".

Thanks to Ben (darktama) for the Nouveau kernel tree.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
