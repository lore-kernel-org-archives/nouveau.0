From: "Jasper Mackenzie" <jasper.mackenzie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Black screen of death
Date: Sat, 05 Feb 2011 16:58:57 +1300
Message-ID: <op.vqev0hi1o2qfwp@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
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

Good day All.
  I switched to nouveau some months back with all packages from Ubuntu  
Natty and xorg-edgers ppa on an Nvidia Go 7950 GTX in a Dell XPS M1710.
All worked very well, better if you dont count 3d speed, and thermal  
management...
  These cards are aprently renoun to burn up, and a month ago I thought I  
had fried it, as I could not get it to start X with the nv, Nvidia, or  
Nouveau driver.
Eventually it worked with Nvidia again. With the new xorg, 1.10, Nvidia is  
not an option.
  Reverting to nouveau had the same troubles as previously.

Screen goes blank soon after initrd loads, and does not return.
Ubuntu adds "set gfxpayload=$linux_gfx_mode" to grub.cfg, and removing  
this option, and splash and quiet, _sometimes_ allowed console login, but  
always black screen if X tried to start
Blacklisting the nouveau kernel module stopped the black screen of death,  
but X would not start
with boot option nouveau.modeset=0 stoppes black screen of death stops,  
but X fails to start with nouveau driver.
  nv works with nouveau blacklisted or modeset disabled. nv does not resume  
1 in 3.

Some logs:
  http://pastebin.com/4wYuV0RX
More specific logs available if needed, cant find the pastebin links atm

lynxeye suggested that this is an issue with "shit in EDID",  I tried  
adding the video=LVDS option to no effect, and xrandr via ssh into running  
X (with blank screen).

  I have tried various kernel/userspace configuartions (2.6.33-38), ubuntu  
natty X, xorg-edgers X, recent opensuse, fedora, and mint live images, all  
with the same issues.

To reiterate, it was working well with nouveau, then suddenly stopped. It  
must have been after an upgrade, but I cannot be sure.

TIA

Jasper
