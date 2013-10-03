From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GeForce 8400 GS
Date: Thu, 03 Oct 2013 23:04:01 +0100
Message-ID: <524DE9D1.3040303@gmail.com>
References: <1380825934.841834684@f291.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1380825934.841834684-MnY5EB7xCO9sdVUOrk1QfQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Fernando Negro <fernando.negro-JGs/UdohzUI@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 03/10/13 19:45, Fernando Negro wrote:
>  Hi everyone.
> 
> I read on a 2011 article - http://www.phoronix.com/scan.php?page=article&item=nouveau_comp_2011&num=19 - that my particular card, GeForce 8400 GS, overheats with nouveau. (So, I never tried using if for long, before, as soon as possible, installing the proprietary drivers...) But, because it's a 2-year-old article, I was wondering if that problem could have been, in the meantime, solved?... (Can anyone tell me if that is so, or not - or indicate me a place where I can know that?)
> 
> Thank you, all, in advance.
> 
Hi Fernando,

The idea of overheating is quite subjective and heavily depends on how
sane the OEM was. But to put a long story short

1. Nouveau does not change the clock frequencies and voltage (among a
few others) which may cause higher than desired temperature for some users.
2. Thermal management has been available for a while now although it's
disabled by default. You would need to enable it manually see [1] [2]

I would personally give nouveau a try if I was in your case and check
the temperature via (lm_)sensors.

Hope that helps,
Emil

[1] http://www.spinics.net/lists/dri-devel/msg31902.html
[2]
http://cgit.freedesktop.org/nouveau/linux-2.6/tree/Documentation/thermal/nouveau_thermal
