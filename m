From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Question about NV18 and GBM library.
Date: Tue, 1 May 2012 11:53:54 +0300
Message-ID: <20120501115354.78d7fb5c@farn.lan>
References: <CAJvabWDH8U_H-LaHj1LzZXYdSGb8E+grNUwDeJK+W0KrxKgAqg@mail.gmail.com>
	<1335462119.2645.1.camel@tellur>
	<CAJvabWApOKF69nDiAmKRrK0vh_9wK+yFe8+J8huiVWMgLYUmsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAJvabWApOKF69nDiAmKRrK0vh_9wK+yFe8+J8huiVWMgLYUmsg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: gabriel muguerza <glmcabra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, 27 Apr 2012 21:11:35 -0300
gabriel muguerza <glmcabra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Thu, Apr 26, 2012 at 2:41 PM, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> wrote:
> 
> > Am Mittwoch, den 25.04.2012, 12:34 -0300 schrieb gabriel
> > muguerza:
> >
> > > Hi,
> > >
> > > I have a geforce 4mx 440 agp 8x, and I'm trying to use the GBM
> > > library,
> > > (as jbarnes in:
> > > http://virtuousgeek.org/blog/index.php/jbarnes/2011/10/
> > > and David Hermann in KMSCON:
> > > https://github.com/dvdhrm/kmscon), without success.
> > >
> > > when I try to create a gbm_device, I get: (below the code.)
> > >
> > > nouveau_drm_screen_create: unknown chipset nv18
> > > dri_init_screen_helper: failed to create pipe_screen
> > > loaded /usr/lib/gbm/pipe_nouveau.so
> > > nouveau_drm_screen_create: unknown chipset nv18
> > > failed to load driver: nouveau
> > >
> > >
> > > My question is:
> > > Is this not supported by the driver?,
> > > It's a GBM problem? or am I doing something wrong?
> > >
> > Yep, you are right, your GPU is simply too old. GBM is only
> > supported with the nouveau gallium drivers, which start with
> > the nv30 generation. The nouveau_vieux driver for your card
> > does not support GBM.
> >
> > -- Lucas
> >
> >
> Ok, thank you.
> (and nor Wayland works, I guess).

You mean Weston. Weston uses GL ES 2, which relies on shaders and
does not have a fixed-function pipeline. NV18 AFAIK does not have
any shader capability, but only a fixed-function pipeline. This
is another big obstacle.

Wayland could be made to work, but it would need some work:
- writing a Wayland server on fixed-function OpenGL
- writing the infrastructure for using EGL/OpenGL on the
  framebuffer offered by DRM

and maybe something else I overlooked.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
