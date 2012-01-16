From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 0/4] nvfx: rework render temps code and fixes
Date: Mon, 16 Jan 2012 01:09:14 +0100
Message-ID: <1326672554.1672.39.camel@tellur>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
	<20120114131404.3f742857.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120114131404.3f742857.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Samstag, den 14.01.2012, 13:14 +0100 schrieb Patrice Mandin:
> Hello,
> 
> I just tried on my NV34 the whole series. Here is what I noticed:

Thanks for testing. Although now after some discussion it seems unlikely
that we will see much of this in nvfx it really helps me to decide if i
can go this way in the rewrite driver.
> 
> - Seems rendering is a bit slower (in ioquake3, in the first map q3dm0,
> rendering the mirror and the portal causes more audio stuttering) but
> it it just my feeling.
Without the render temps we should actually do less work, rather than
more, so you shouldn't see any slowdown from this. Maybe we are hitting
a slow path elsewhere in the driver (like a cpu copy of a gpu only
surface).

> 
> - ut2004demo hangs at start (display just one frame in the nvidia
> licence plate part), but the system does not crash, and the game can be
> killed.
> 
> Do you want me to check which of your patches makes ut2004 hanging?
> 
No, please just check dmesg, to see if you get any errors there. I will
try to reproduce with my setup.

Thanks,
Lucas
