From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Trouble with building xf86-video-nouveau
Date: Wed, 6 Oct 2010 17:35:02 +0300
Message-ID: <20101006173502.707ec26e@daedalus.pq.iki.fi>
References: <39cd79ff15131cff86908d06f0863e8f3dad41ea@mail.qip.ru>
	<i8fmiq$2uf$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <i8fmiq$2uf$1@dough.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: walt <w41ter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 05 Oct 2010 10:17:05 -0700
walt <w41ter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 10/04/2010 10:38 PM, noname_oz-EE1Pc4pW+aiHXe+LvDLADg@public.gmane.org wrote:
> > I have problem with building nouveau driver. I already have
> > installed latest versions of mesa and libdrm. In process of
> > building i have this error:
> >
> > drmmode_display.c: In function drmmode_xf86crtc_resize:
> > drmmode_display.c:1076: error: struct _ScrnInfoRec has no
> > member named pixmapPrivate
> 
> Two wild guesses.  Do you have the proprietary nvidia-drivers
> package installed? If so, run 'eselect opengl list' to find out
> which version you are using.  Try switching to the xorg-x11
> version.
> 
> The *-9999 package just pulls from the git repository and build
> whatever code happens to be there at the time.  Try re-installing
> the package again to get any commits you may have missed the
> first time.

No, this is a known breakage due to API changes in the X.org
server. Nouveau DDX does not yet have a fix.

There is already a bug report:
https://bugs.freedesktop.org/show_bug.cgi?id=30482

In the mean time, you just need to revert to an older
(preferrably released) X server.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
