From: Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux 3.7-rc1 (nouveau_bios_score oops).
Date: Sun, 21 Oct 2012 12:33:38 +0200
Message-ID: <2111474.XJ0TZDGYZs@al>
References: <1724445.dN2yMEzN6d@localhost> <1437818.9jlLBUTXHL@al>
	<20121021090310.GB2403@fritha.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121021090310.GB2403-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Heinz Diehl <htd-iEI8Y0CNJBYdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Sikora <pawel.sikora-PIIpFW8S9c0@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Heinz Diehl <htd-HjJ2MNWy62to6+H+lsi3Gti2O/JbrIOy@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sunday 21 October 2012 11:03:10 Heinz Diehl wrote:
> The machine is the same, the BIOS is updated since then. The output of
> the actual "acpidump" is here:
> 
> http://www.fritha.org/acpidump.gz

The _ROM method is still the same. It looks like a general issue with Asus
laptops. Pawel also has the Asus laptop <https://lkml.org/lkml/2012/10/21/11>
and has the same _ROM method. Some other acpidumps I have checked 
before also expose this behavior.

Ben, I am wondering what machine provided a VBIOS > 64KiB?

Regards,
Peter
