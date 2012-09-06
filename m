From: =?ISO-8859-15?Q?Sven_K=F6hler?= <sven.koehler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Second monitor needs explicit ModeLine
Date: Thu, 06 Sep 2012 16:59:06 +0200
Message-ID: <k2adnq$qph$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

without an explicit ModeLine in xorg.conf, the full resolution of my
secondary monitor is not listed in Xorg.0.log, xrandr, or gnome's
configuration tool. If the secondary Monitor is the only one that is
connected, its native resolution works and is chosen by default.

I was able to get a suitable ModeLine by disconnecting my primary
monitor. Right now, with the ModeLine in place, both monitors work
perfectly.

My primary monitor is a P24W-3 and the secondary is a P20-1.
The native resolutions of the LCD screens are 1920x1200 and 1600x1200.
If both monitors are connected, the 1600x1200 is not available by
default for some reason.

Note, that I'm using video=1600x1200-16 on my kernel command line
without problems. Any ideas what could be the cause?

Here is my Xorg.0.log with the ModeLine in place:
http://pastebin.com/3fLg61SN


Regards,
  Sven
