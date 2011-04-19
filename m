From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Safer reclocking
Date: Tue, 19 Apr 2011 05:45:28 +0300
Message-ID: <1303181128.2802.9.camel@maxim-laptop>
References: <1300572857-8712-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300572857-8712-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

On Sat, 2011-03-19 at 23:14 +0100, Martin Peres wrote:
> This version corrects the missing symbol linking error you could get by compiling on a x86_32 kernel:
> ERROR: "__udivdi3" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
> 
> Again, please test it on hw ranging from nv30 to nva0 (nvac/ION is supported)

Martin Peres, Hi!

Any update on this support?

The old patch of yours that works fine on my card surely doesn't apply
to latest git. I am going to forward-port it so I could switch to next
kernel, but I was thinking that maybe you have a new version of this
patch, so I won't waste my time.
Without this patch, reclocking is very very unstable as you know, but I
need it to keep card temperature within reasonable bounds.

(And pref level 0 gives me ~50 FPS in compiz....)

Speaking of performance, offtopic, nouvaeu + kwin isn't usable at all,
but compiz really is.

Kwin on the other hand is dead slow even on perf level 2, and
surprisingly, even if I start compiz in KDE it is significantly slower
that same compiz in Gnome (but usable).

And when I move mouse over any Qt application, FPS drops below 5 FPS,
probably due to mixture of Xrender and GL calls.
So nouveau + kwin is absolutely not usable.

compiz + gnome without any open windows shows ~300 FPS on perf level 2
slightly higher that nvidia blob.

I own quite slow card, nvidia geforce 8400M GS, codename NV86

I am looking forward to switch to KDE in near future.

Best regards,
	Maxim Levitsky
