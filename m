From: Jason White <jason-4rxGbHaoKybk1uMJSBkQmQ@public.gmane.org>
Subject: System hang with Nouveau under Debian Sid
Date: Mon, 9 Mar 2009 20:34:19 +1100
Message-ID: <alpine.DEB.2.00.0903092017250.4906@jdc.jasonjgw.net>
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

First the background: Debian bug #513904 with the NV driver:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=513904

The NV driver started hanging inexplicably in nvSync(). I suspected, and still
suspect, hardware problems with this card - an NVidia Quadro 3500 (it came
with the machine, I didn't choose it). It was behaving well until late
January.

The card however passed the diagnostic tests on the HP Insight Diagnostics CD
even after the problem started to occur.

In an attempt to work around this, I tried the Nouveau driver as packaged in
Debian Sid,
xserver-xorg-video-nouveau 1:0.0.10~git+20090205+4dfd0b1-1
with the corresponding kernel modules compiled with module-assistant, using a
recent Debian Sid 2.6.26 kernel.

The X server and the Gnome desktop environment started successfully, but after
a few minutes of usage, there was a kernel hang - no response even to pings
from other machines on the network.

Any suggestions as to possible causes and solutions would be gratefully
accepted.

My ability to test updated drivers is limited by the fact that I want to avoid
unclean file system shutdowns (i.e., hangs at the kernel level) on this
machine as much as possible.  Having said that, I'm interested in having this
resolved, so I'm perfectly willing to help with testing as time permits.

This appears to be a relatively well known problem at least with the NV
driver. I appreciate that it's a timing issue that might be difficult to
isolate.

Also, if this is the wrong forum in which to raise this issue, apologies in
advance.
