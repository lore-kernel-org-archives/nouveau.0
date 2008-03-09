From: "seventh guardian" <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Current state - how to get gallium-stuff running?
Date: Sun, 9 Mar 2008 01:25:11 +0000
Message-ID: <1caff7430803081725l50360a1end8438c80cddac2b1@mail.gmail.com>
References: <200803072132.23321.hanno@hboeck.de>
	<1204932443.8406.21.camel@CowboyLaputopu>
	<200803081504.35171.hanno@hboeck.de>
	<20080309000013.126a89d1@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20080309000013.126a89d1-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
Content-Disposition: inline
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

On Sat, Mar 8, 2008 at 10:00 PM, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
> On Sat, 8 Mar 2008 15:04:30 +0100
>  "Hanno B=F6ck" <hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org> wrote:
>
>  > Using Gentoo, using the nouveau-overlay. Installing git-packages of li=
bdrm,
>  > x11-drm, xf86-video-nouveau. Changed mesa-package to fetch nouveau/mes=
a git
>  > with gallium-0.1 branch. installed that.

Didn't know that "official" gallium development moved from darktama's
git (which is good I guess) ;)
Probably been away for too long...

>  Here might be the reason, maybe the ebuild is still building the wrong
>  branch. Git ebuild coding has a nasty feature, but you are safe if you s=
et
>  *both* TREE and BRANCH. And I don't remember if it requires other change=
s,
>  too.
>
>  Anyway, I'd recommend building mesa by hand, so you are sure which branch
>  you build and how.

Not sure if this matters, but I've noticed that the nouveau_dri.so
library isn't built when doing "make linux-dri-x86-64
DRI_DIRS=3Dnouveau_winsys". I had to manually build it.

Cheers,
  Renato Caldas
