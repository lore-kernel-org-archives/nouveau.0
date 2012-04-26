From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/nouveau: implement precise vblank
 timestamping
Date: Thu, 26 Apr 2012 23:31:24 +0200
Message-ID: <1335475884.2645.4.camel@tellur>
References: <1335392782-2141-1-git-send-email-dev@lynxeye.de>
	<1335392782-2141-2-git-send-email-dev@lynxeye.de>
	<CAGZ4FEQkr9jt6cpius9DDrk_oPiQehxNnGV_UBBqCzqZomc-ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FEQkr9jt6cpius9DDrk_oPiQehxNnGV_UBBqCzqZomc-ag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>, Mario-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Maarten,

Am Donnerstag, den 26.04.2012, 23:25 +0200 schrieb Maarten Maathuis:
> It seems a bit strange to go in between a register and defines that
> probably belong to that register.
> 
Yes, you are right. Thanks for catching this. I will fix this up, but
will wait for Ben's comments and/or other review feedback before
spamming the list with just another version of this patch.

-- Lucas
> On Thu, Apr 26, 2012 at 12:26 AM, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> >  #define NV_PCRTC_ENGINE_CTRL                           0x00600860
> > +#define NV_PCRTC_STAT(i0)                      (0x00600868 + 0x2000*(i0))
> >  #      define NV_CRTC_FSEL_I2C                                 (1 << 4)
> >  #      define NV_CRTC_FSEL_OVERLAY                             (1 << 12)
> 
> 
> 
