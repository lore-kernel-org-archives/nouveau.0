From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Selecting supported chipsets in the driver?
Date: Tue, 30 Jul 2013 23:31:03 +0100
Message-ID: <51F83EA7.8050704@gmail.com>
References: <CAMjv+TQLp4dCfa0FHmfUOYZR3H_RMwiev=59Ocr3WN=drky=YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMjv+TQLp4dCfa0FHmfUOYZR3H_RMwiev=59Ocr3WN=drky=YQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christ-Jan Wijtmans <cj.wijtmans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 30/07/13 21:39, Christ-Jan Wijtmans wrote:
> Hi, my apologies if this is the wrong place to post this.
> I had the desire to turn on or off support for certain chipsets.
> Because i felt like the nouveau drivers are (relatively) quite large and
> depends on some kernel code that would only be used for certain chipsets.
> I will take some time this week to see how this is coded and if its
> possible but i just wanted a head sup opinion on you guys before i start
> wasting my time.
> 
I'm not entirely sure if you're talking about the kernel module, ddx
(xf86-video-nouveau) or mesa.

In either case, all three should be relatively easy to do, as normally
the generation specific code is divided. Not too sure if it's worth the
effort though

* kernel module - 1.7 MiB, ~400KiB gzip
* ddx - ~200KiB
* mesa - 6.3 MiB (nouveau/gallium only)

As you can see the sizes are not that big, and I'm not sure if the
maintainers would be up-to the idea

Not a maintainer myself so take the last statement if a healthy pinch of
salt :)

Cheers
Emil

> 
> Live long and prosper,
> 
> Christ-Jan Wijtmans
> 
> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 
