From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad
 arguments to nouveau_vma_getmap
Date: Fri, 3 Jan 2014 20:32:13 +0200
Message-ID: <20140103183213.GV2924@reaktio.net>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<CACAvsv7ygYoM6ZzFdY-Zov0herPMQDERaw6jzj6VuB+p20FcJQ@mail.gmail.com>
	<5226DA41.5060203@canonical.com>
	<20130925144152.GK2924@reaktio.net>
	<CACAvsv6qUEug7=7uRHPm6zpbjmA3Cc-u06VBOq0dU8eiJ-fvmg@mail.gmail.com>
	<20131018144445.GP2924@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131018144445.GP2924-GxtO3QLqHcLR7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Oct 18, 2013 at 05:44:45PM +0300, Pasi K=E4rkk=E4inen wrote:
> On Thu, Sep 26, 2013 at 02:48:49AM +1000, Ben Skeggs wrote:
> > >
> > > Ben/Maarten: Are you guys planning to take a look at this and submit =
another patch, or.. ?
> > >
> > > I tested the two earlier patches from this thread, and they both fixe=
d the problem (hard kernel crash).
> > > I'm hoping this bug could be finally solved in the kernel..
> >
> > I shall be looking at it properly once I'm back from XDC next week.
> > =

> =

> Any thoughts about the patch? =

> =

>

Ben: ping again? =


This nouveau bug is still causing hard kernel crashes out there..
recent bug report against Fedora 20: https://bugzilla.redhat.com/show_bug.c=
gi?id=3D1047169

Thanks,
 =

-- Pasi

> =

> > Thanks,
> > Ben.
> > =
