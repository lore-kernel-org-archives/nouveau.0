From: Philipp Jocham <philipp.jocham-hi6Y0CQ0nG0@public.gmane.org>
Subject: Nouveau / GeForce 7600 GS / DualHead / AMD64x2
Date: Wed, 20 Feb 2008 00:16:10 +0100
Message-ID: <47BB633A.5070104@gmx.net>
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


Hi all!

I just wanted to tell you that I checked out the latest
nouveau version and replaced the old 'nv' driver.

Additionally to the installation instruction I added
   Option "RandR12" "true"
to the Device section
and
   Virtual 2560 1024
to the Display subsection in the /etc/X11/xorg.conf file.

Putting
xrandr --output DVI-D-1 --auto --output DVI-D-0 --auto --left-of DVI-D-1
into my ~/.xinitrc, gives me a nice and working dualhead setup!

Great work!

Regards, Philipp
