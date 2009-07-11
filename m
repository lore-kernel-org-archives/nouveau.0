From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Can't build xf86-video-nouveau
Date: Sat, 11 Jul 2009 11:44:25 +0300
Message-ID: <20090711114425.5ab14910@daedalus.pq.iki.fi>
References: <6d4bc9fc0907101149v3c552b04vd74d6d3f8a7bde47@mail.gmail.com>
	<1676.4193-3052-1930720128-1247299656@seznam.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1676.4193-3052-1930720128-1247299656-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Jarom=EDr_C=E1p=EDk?= <tavvva-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 11 Jul 2009 10:07:36 +0200 (CEST)
Jarom=EDr C=E1p=EDk <tavvva-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> wrote:

> Hi Maarten, Pekka ... =


Seeing your comment "I have libdrm from git installed"...

> I tried to download the latest one 2.4.11 .... =

> the same result with lib64drm from the distro repository ...
> =

> lib64drm2-2.4.11-1mdv2010.0.x86_64
> lib64drm_intel1-2.4.11-1mdv2010.0.x86_64
> lib64drm_nouveau1-2.4.11-1mdv2010.0.x86_64
> lib64drm_radeon1-2.4.11-1mdv2010.0.x86_64

Have you all these still installed? Have them removed, please.
Is there a package lib64drm, since there is a lib64drm2? Remove them all.
libdrm 2.4.11 is too old, there is no released libdrm that is recent enough.

> I am still getting the same error:
> =

>    (EE) NOUVEAU(0): [drm] wrong version, expecting 0.0.12

Apparently Maarten is right, and the libdrm you are using with
xf86-video-nouveau is an ancient version. The version number refers to
libdrm 2.4.11 or earlier.

I think you need to start clean: hunt down and remove all files related
to libdrm, xf86-video-nouveau and drm.ko, ttm.ko and nouveau.ko.
Then follow InstallNouveau instructions to the point.

> I downloaded the stuff from these locations:
> http://people.freedesktop.org/~pq/nouveau-drm/master-compat.tar.gz

You may want to keep this package and not download again yet,
some cards (nv20 family at least) have problems with the latest.

> git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau =

> git://anongit.freedesktop.org/git/mesa/drm =


You don't need to clone these again, just 'make distclean', and start
from autogen or configure step.

> I already solved some problems with directories
> (like copying the modules and libs from /usr/local/lib to /usr/lib64)
> but as I unfortunately have no overview about this project =

> it's hard for me to do any troubleshooting in this area ... =


The manual copying probably breaks things, because pkg-config still
assumes the headers and libs are found in /usr/local, not /usr. Or maybe
you have headers in both places?

This copying will not be needed if you use --prefix as instructed when
compiling libdrm. If you hit an error due to using --prefix, we have
seen it before, and I never really found out why it is, I never hit it.
I'm waiting for someone to diagnose it. Seems to depend on one's
distribution.

Let us know how it goes.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
