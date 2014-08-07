From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: NV25 doesn't draw most icons
Date: Thu, 07 Aug 2014 08:30:32 -0400
Message-ID: <20140807083032.oo6ofuepycoosgk8-cebfxv@webmail.spamcop.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello!

I've installed Fedora 20 Mate i386 on an old system with GeForce4 Ti  
4200 AGP (NV25) and I see significant visual defects. Many icons are  
not shown. They can reappear if they are selected of the mouse goes  
over them. Screenshot:
http://red-bean.com/proski/nv25/screenshot.png

All entries on the left should have icons, but only two have them.

The problem goes away I create a file /etc/modprobe.d/nouveau.conf containing
"options nouveau noaccel=1", rebuild initrd and reboot.

I compiled Linux kernel 3.16 and I see exactly the same problem. .config:
http://red-bean.com/proski/nv25/kernel.config

I tried opening many tabs with flash based videos in Firefox and got a  
hang. At first, the mouse worked, I was able to switch to the console  
with Ctrl-Alt-F2, but when I switched back to X, the system was  
totally unresponsive and I had to power cycle it. The kernel log for  
3.16:
http://red-bean.com/proski/nv25/dmesg

The output of "lspci -nnvvvxxx":
http://red-bean.com/proski/nv25/lspci-nnvvvxxx

Fedora 20 is fully up-to-date. MATE appears to be most affected, but  
I've also seen incorrectly drawn checkboxes in LDXE on that system.

I'm ready to donate that video card to the project if anyone is interested.

-- 
Regards,
Pavel Roskin
