From: schmirrwurst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Subject: Put acpi/backlight code into kernel
Date: Sat, 22 Aug 2009 20:34:28 +0200
Message-ID: <200908222034.28782.schmirrwurst@googlemail.com>
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

I'm trying to bring devs to support for backlight on nv50 cards for above 1 
year, without any success
A lot of laptop (from mac, hp, samsung) doesn't have laptop_panel in hal, and 
therefore no support for acpi/backlight..., and no entry in /proc/acpi/video 
nor /sys/class/backlight

Kernel team is not reacting, hal team won't fix, devicekit need standardise 
i/o...

I've tried nouveau, the acpi/backlight support works pretty well, but the 
driver itself is unusable for lambda users, it needs some times...
So I'm asking if someone could put the backlight code in a kernel module, or 
in the kernel itself, for people to have backlight support even when using 
nvidia driver or nv, or vesa... ???
