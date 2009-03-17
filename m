From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [NV50] application to confirm texture layout
Date: Wed, 18 Mar 2009 09:19:33 +1000
Message-ID: <1237331973.7407.2.camel@localhost.localdomain>
References: <6d4bc9fc0903111207w5e6486f5we77c274f9b0708bc@mail.gmail.com>
	<6d4bc9fc0903111209h71135386j57dc89c00c70ed8f@mail.gmail.com>
	<6d4bc9fc0903120542t25f3892es5c1b5cbef3439b98@mail.gmail.com>
	<6d4bc9fc0903141036g50a76944se64fc217fc7ad1bc@mail.gmail.com>
	<6d4bc9fc0903150418l5af43dfcx127e530fb31bdf37@mail.gmail.com>
	<6d4bc9fc0903151518r733fa359i44cf4685b9fdf37f@mail.gmail.com>
	<6d4bc9fc0903160339jdc4bbb1x7067a8c4a145ca07@mail.gmail.com>
	<6d4bc9fc0903170207t1bbbd923sfc1b9350b4117c3c@mail.gmail.com>
	<6d4bc9fc0903171606t357f3c6dmb384067b23cc61a0@mail.gmail.com>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0903171606t357f3c6dmb384067b23cc61a0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 2009-03-18 at 00:06 +0100, Maarten Maathuis wrote:
> Again reduced to just the 8bpp test, the special test remains to find
> any deviations from the standard layout.
> 
> I added a NV84_MODE to adjust for the layout found by KoalaBR,
> hopefully it's correct (hint test it ;-)).
> 
> At this point i know:
> 
> Normal: NV86
> NV84: NV84
> NV9X: NV92 NV96
NV84GL runs without issues with NV84_MODE=1.  I'll all also test my NV84
(I know it's been done, but best to make sure!) when I get home.

Ben.
> 
> So people, chime in and confirm (even if your card is already on the list).
> 
> Maarten.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
