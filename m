From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: Debugging help needed
Date: Sat, 29 Aug 2009 16:08:13 +0200
Message-ID: <20090829140813.E0D3833C2A5@tippex.mynet.homeunix.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


Hi,

I once had nouveau working and stable back whem 2.6.29 was released.
Nowadays, it hangs within less tahn an hours work. The symptom is that 
the mouse moves, but no other updates to the screen. The machine is
otherwise working mostly ok so I can ssh to it. The "issue" I have is 
that there is nothing interesting (afaict) in any log. Nothing in 
Xog.0.log, nothing in dmesg.

The one intersting thing I've noticed is that with drm debuging on I get 
a ton of these on dmesg:

host [drm:drm_ioctl], pid=2391, cmd=0x40086485, nr=0x85, dev 0xe200, auth=1

And at, or around the hang, there seem to be a an increase of:

host [drm:drm_ioctl], ret = fffffff5

Not particilarly enlighening to the uninitiated.

Any ideas how to debug these hangs? Are ther any tools around to e.g. 
reset the GPU?

/Anders
