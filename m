From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: Low power operational mode of nv50
Date: Sat, 22 Jan 2011 12:49:28 +0100
Message-ID: <4D3AC448.5040200@free.fr>
References: <4D3ABBD6.1070509@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D3ABBD6.1070509-S0/GAf8tV78@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le 22/01/2011 12:13, Jan Kiszka a =E9crit :
> Hi,
>
> what are the missing bits to get nv50-class hardware into lowest power
> mode? Even when clocking down to perflvl 0, the GPU temperature of my
> Quadro FX 880M is still quickly climbing until it reaches 60 =B0C and the
> fan goes on for a while (I tried up to 2.6.38-rc1 so far - any progress
> in nouveau-next?). This is not only annoying but also sucking several
> watts more than what is feasible - unfortunate for mobile operation.
>
> The benchmark is still the blob which runs the card at level 0 around 54
> =B0C, and that means fan-less. But as the blob is causing increasing
> troubles across suspend/resume, not to speak of all its other
> limitations. So I'd rather like to switch ASAP now.
>
> What may cause this different power consumption? As the clocking is
> apparently the same (the blob even claims to use a few more MHz), I was
> wondering if the less sophisticated firmware of nouveau could be the
> reason. Or is the host driver keeping the GPU too busy even in idle state?
>
> Is there anything I could do to help analyzing or even resolving this iss=
ue?
>
> Thanks,
> Jan
Hi,

To put it simply, I have no idea :s I spotted some strange behaviour =

(that could indicate some power management) when tracing the kernel but =

my attempts to mimic it led to ..... 0.1W less (I guess it's just noise).

I must admit I'm not working enough on it yet, this is because I would =

like to get safe recloking and fan management out of the door before =

looking at real power management, but if you have some knowledge in the =

field, I would love if you could give me a hand on this :)

I'm pretty sure the difference in power consumption is due to un-needed =

engines running. I may have a look at it this week as I'll be away from =

my desktop computer.

Anyway, I'll be in Germany next week, are you living close to Bochum? We =

could talk about this if you want/can.

Take care,
Martin
