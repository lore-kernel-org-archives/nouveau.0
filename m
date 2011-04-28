From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] reclocking stability improvements
Date: Thu, 28 Apr 2011 13:32:26 +0300
Message-ID: <1303986746.6092.6.camel@maxim-laptop>
References: <1303948692-22455-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1303948692-22455-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 2011-04-28 at 01:58 +0200, Martin Peres wrote:
> Hi everyone,
> 
> I would like everyone to test this set of patch as we'll need them quite soon for timing management on nv50.
> 
> Please report success/failure by answering to this email.
> 
> Thanks in advance,
> Martin

I tested this.
Patch seems to work except following problems:

Sometimes reclocking fails like this:

root@maxim-laptop:/home/maxim# echo 2 > /sys/class/drm/card0/device/performance_level
bash: echo: write error: Resource temporarily unavailable


[  630.371117] [drm] nouveau 0000:01:00.0: setting performance level: performance_level_2
[  630.412048] [drm] nouveau 0000:01:00.0: PFIFO DMA_PUSH never depleted (0xd06091)

Once it even  hang the GPU.
Easy to reproduce while running compiz and its benchmark overlay.


Also, it seems not to restore perf level after resume from ram.

Best regards
	Maxim Levitsky


> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

-- 
Best regards,
        Maxim Levitsky

Visit my blog: http://maximlevitsky.wordpress.com
Warning: Above blog contains rants.
