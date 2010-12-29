From: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: ../nouveau_drv.so: undefined symbol: RegionEmptyData
Date: Wed, 29 Dec 2010 20:17:22 +0100
Message-ID: <87zkromlrx.fsf@turtle.gmx.de>
References: <slrnihn05j.qck.mbj@gatsby.mbjnet.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <slrnihn05j.qck.mbj-CSxCbkMeKokOWjwv5PthnA@public.gmane.org> (Morten Bo Johansen's
	message of "Wed, 29 Dec 2010 19:40:49 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Morten Bo Johansen <public-mbj-0XdUWXLQalXR7s880joybQ-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>
Cc: public-nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: nouveau.vger.kernel.org



On 2010-12-29 19:40 +0100, Morten Bo Johansen wrote:

> I get the above error message when trying to run the latest
> xf86-video-nouveau driver from the git repository. It prevents the driver
> from loading. If I revert back to the Debian version 
> 1:0.0.15+git20100329+7858345-5 of that driver, then the driver loads, but
> there are many issues with that version that I hoped an upgrade could
> fix.
>
> Information about my hardware and software:
>
>   GPU: GigaByte GV-N68128DH
>   Kernel: 2.6.37 with the latest Nouveau git tree
>   Drm: latest git version
>   Nouveau: latest git version
>   xserver-xorg-core: 1.7.7-10
>   xserver-xorg-dev: 1.9.0.902-1

You need to install xserver-xorg-core from Debian experimental as well,
1.7.7 is too old.

Sven
