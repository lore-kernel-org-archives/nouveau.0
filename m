From: Shea Levy <shea-yfkUTty7RcRWk0Htik3J/w@public.gmane.org>
Subject: nv_backlight non-functional on MBP 5,3 in EFI mode
Date: Thu, 22 Mar 2012 08:20:55 -0400
Message-ID: <4F6B1927.6080002@shealevy.com>
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

Hello,

On my MBP (booted with noaccel=1 due to 
https://bugs.freedesktop.org/show_bug.cgi?id=27501), the nv_backlight 
sysfs knob is non-functional (though modifying nv_backlight/brightness 
does change nv_backlight/actual_brightness). Recently a patch was 
submitted to LKML to create a brightness control for Apple computers 
with a gmux (https://lkml.org/lkml/2012/3/16/388), the created sysfs 
knob does work for me.

Cheers,
Shea Levy
