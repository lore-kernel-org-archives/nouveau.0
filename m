From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pre-nv50 KMS
Date: Mon, 25 May 2009 13:01:07 +1000
Message-ID: <1243220467.19524.1.camel@localhost.localdomain>
References: <beb59a440905230149m2edc3f6ak3c61a45820a66c5f@mail.gmail.com>
	<beb59a440905230900x302478aoc3e9377c45d32b78@mail.gmail.com>
	<beb59a440905240227u181f817ck33274c4f2a755be3@mail.gmail.com>
	<6d4bc9fc0905240803m54402ce1r9754a6bafaf36c48@mail.gmail.com>
	<beb59a440905241701p4d25cf00jb059efdf187c41a7@mail.gmail.com>
	<1243210441.2864.5.camel@localhost.localdomain>
	<beb59a440905241908la3eb9b2ma158b402912b288e@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <beb59a440905241908la3eb9b2ma158b402912b288e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luo Jinghua <sunmoon1997-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2009-05-25 at 10:08 +0800, Luo Jinghua wrote:
> > It'll likely work well everywhere except nv4 if my own pre-nv5x kms code
> > is any indication.  I've got fixes to TTM for nv4 in my kernel tree I'll
> > post sometime this week.
> >
> 
> I'll try your tree once you published it. I get another issue, the DDX
> driver don't hide the cursor on leaving vt and left the cursor on my
> fb console. It may be already fixed in your local tree.
Mmm, the DDX I was using was the same as what's now in git, so it'd be
something on the kernel side.  The cursor was hidden for me when I
dropped back to a console however.

Testing would be good though, I don't have a (working) pre-nv5x laptop
to test LVDS on anymore.  Otherwise, from nv4 right through to nv4x
seems good.

Ben.
> 
> 
