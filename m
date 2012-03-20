From: Shea Levy <shea-yfkUTty7RcRWk0Htik3J/w@public.gmane.org>
Subject: Macbook Pro 5,3 Video Issues
Date: Tue, 20 Mar 2012 18:09:07 -0400
Message-ID: <4F690003.1040404@shealevy.com>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello,

On my system (Linux 3.3, booting in EFI mode, using Nouveau with 
nouveau.noaccel=1 due to 
https://bugs.freedesktop.org/show_bug.cgi?id=27501 ), I can't figure out 
how to change the backlight or switch which of the two graphics cards (I 
have an Nvidia 9600M GT and a 9400M, both are recognized by nouveau but 
only the 9400M is ever used) Linux uses for the framebuffer or X uses 
for the output. I have /sys/class/backlight/nv_backlight, and writting 
to nv_backlight/brightness does change the value in 
nv_backlight/actual_brightness, but no actual screen changes occur. I'm 
using the in-tree staging version of nouveau, so I wasn't sure which ML 
this should go to.

Cheers,
Shea Levy
