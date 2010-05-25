From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Kernel module fails to initialize on AMD751 based
 system with NV34
Date: Wed, 26 May 2010 01:23:34 +0300
Message-ID: <20100526012334.43a9d5f6@daedalus.pq.iki.fi>
References: <AANLkTilecapB4FA9X-aufTLQql_-tkjv786dkH8L2H9N@mail.gmail.com>
	<AANLkTim9Eh1tnMgYM_NyGkjQI9cq0wyvUbZkd1IeaVo-@mail.gmail.com>
	<AANLkTilNGyLcP8Dr95RJJx1T5lWBXbRmB1ZtnbRBJBA6@mail.gmail.com>
	<AANLkTinDO1dTAEm8cFA9rQ5ba2tkubCtrDgGgHymjt4M@mail.gmail.com>
	<20100524233930.6f954897@daedalus.pq.iki.fi>
	<AANLkTimFEvBkkFg-FtqjCwSzXDqixYxd2ef8ZCeYpbTI@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimFEvBkkFg-FtqjCwSzXDqixYxd2ef8ZCeYpbTI-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 24 May 2010 22:55:46 +0200
Clemens Eisserer <linuxhippy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
> 
> > NV0? That's a very bad sign to start with. I'm surprised
> > Nouveau does not just throw up right there.
> 
> Nouveau status page says NV0x is supported for basic 2D stuff.
> Beside that, I started with NV34 and after that failed, I tried
> that NV0x card.

Notice, how the log did not say NV4, NV04, NV5 nor NV05;
it said NV 0. Your NV34 is detected properly, though.

> > These both mention nvidiafb, one of them even rivafb.
> > Are you sure these are not loaded? (This is a basic
> > troubleshooting question,
> > http://nouveau.freedesktop.org/wiki/TroubleShooting )
> 
> Come on, I wouldn't have asked here if that would be the case.

In that case you will be surprised to hear that quite many
people ask before reading TroubleShooting.

Sorry, I missed the link to the Ubuntu bug report.
The kernel log there shows that a conflicting driver is
loading:

[    3.772842] vga16fb: mapped to 0xc00a0000
[    3.773752] fb0: VGA16 VGA frame buffer device

vga16fb is specifically mentioned as conflicting in
TroubleShooting.

Could you try without vga16fb?


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
