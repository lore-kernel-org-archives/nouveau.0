From: Sjon <archlinux.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org>
Subject: Canvas in Firefox, corruption
Date: Sat, 14 Aug 2010 14:49:26 +0200
Message-ID: <4C6690D6.6050507@spider007.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

I have been using nouveau for a few months now, and it works fine.

A few weeks ago I noticed something is broken though; since Google 
switched to using Canvas for their image search I am having some sort of 
corruption in the thumbnails that Google serves.

More information plus screenshots are available here:

https://bbs.archlinux.org/viewtopic.php?id=101469
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/608613

I was wondering if there is anything I can do to help debugging this? My 
setup currently is Archlinux with a GeForce 9800 GTX and these package 
versions:

nouveau-drm-lts 0.0.16_20100313-2
nouveau-firmware 20091212-4
xf86-video-nouveau 0.0.16_git20100517-1

I do not see any errors getting logged when this corruption appears, is 
there any way to make a debug-version of nouveau to get additional 
information?

Thanks,

Sjon
