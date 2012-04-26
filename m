From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: Question about NV18 and GBM library.
Date: Thu, 26 Apr 2012 19:41:59 +0200
Message-ID: <1335462119.2645.1.camel@tellur>
References: <CAJvabWDH8U_H-LaHj1LzZXYdSGb8E+grNUwDeJK+W0KrxKgAqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAJvabWDH8U_H-LaHj1LzZXYdSGb8E+grNUwDeJK+W0KrxKgAqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Mittwoch, den 25.04.2012, 12:34 -0300 schrieb gabriel muguerza:

> Hi,
> 
> I have a geforce 4mx 440 agp 8x, and I'm trying to use the GBM
> library, 
> (as jbarnes in:
> http://virtuousgeek.org/blog/index.php/jbarnes/2011/10/
> and David Hermann in KMSCON: https://github.com/dvdhrm/kmscon), 
> without success.
> 
> when I try to create a gbm_device, I get: (below the code.)
> 
> nouveau_drm_screen_create: unknown chipset nv18
> dri_init_screen_helper: failed to create pipe_screen
> loaded /usr/lib/gbm/pipe_nouveau.so
> nouveau_drm_screen_create: unknown chipset nv18
> failed to load driver: nouveau
> 
> 
> My question is:
> Is this not supported by the driver?,
> It's a GBM problem? or am I doing something wrong?
> 
Yep, you are right, your GPU is simply too old. GBM is only supported
with the nouveau gallium drivers, which start with the nv30 generation.
The nouveau_vieux driver for your card does not support GBM.

-- Lucas
