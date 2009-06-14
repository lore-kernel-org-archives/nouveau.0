From: Alistair Buxton <a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Sun, 14 Jun 2009 23:56:45 +0100
Message-ID: <3d374d00906141556y44d5d493j330cc1ebf79e5968@mail.gmail.com>
References: <20090614183442.GA13749@feanor>
	<3d374d00906141158h28a7d688re1133b656dcdb6c5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3d374d00906141158h28a7d688re1133b656dcdb6c5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

2009/6/14 Alistair Buxton <a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Good to see discussion of this issue, it's been plaguing me for ages.
>
> In order to drive my PAL TV I had to patch nouveau to reduce minimum
> dot clock, as described here:
>
> http://bugs.freedesktop.org/show_bug.cgi?id=20298
>
> Same is required for nv but not nvidia.
>
> Also, afaik, nv/nouveau does not support interlaced modes at all.
>
> --
> Alistair Buxton
> a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>

Oops, my bug was fixed and I didn't notice ... thanks :)

Also, it is only needed to get square(ish) pixels in none-interlaced modes.

Stupid question: Given the presence of a register which indicates the
current field, why can't NVWaitVSync simply wait until the end of the
second field, by doing whatever it does twice iff it is called during
the first field? This method shouldn't require any patches in player
software, since by default they treat the two interlaced fields as a
single frame, and can swap the field order if necessary.

-- 
Alistair Buxton
a.j.buxton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
