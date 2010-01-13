From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25938] black screen on the iMac powerpc using nouveau
Date: Wed, 13 Jan 2010 02:46:50 -0800 (PST)
Message-ID: <20100113104650.AA4B72DC105@annarchy.freedesktop.org>
References: <bug-25938-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25938-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25938





--- Comment #2 from Andrea Tacconi <tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>  2010-01-13 02:46:49 PST ---
the problem of black screen seems to be resolved adding the following patch:
Adding nv18 card identifier to Powerbook specific quirks
in nouveau kernel module:
diff nouveau_bios.c.old nouveau_bios.c
3199c3199
<       if (script == LVDS_RESET && ((dev->pci_device & 0xffff) == 0x0179 ||
(dev->pci_device & 0xffff) == 0x0329))
---
> 	if (script == LVDS_RESET && ((dev->pci_device & 0xffff) == 0x0179 ||(dev->pci_device & 0xffff) == 0x0189 || (dev->pci_device & 0xffff) == 0x0329))

same as in xorg driver:

diff nv_bios.c.old nv_bios.c
2592c2592
<       if (script == LVDS_RESET && ((pNv->Chipset & 0xffff) == 0x0179 ||
(pNv->Chipset & 0xffff) == 0x0329))
---
> 	if (script == LVDS_RESET && ((pNv->Chipset & 0xffff) == 0x0179 ||(pNv->Chipset & 0xffff) == 0x0189 || (pNv->Chipset & 0xffff) == 0x0329))

Now both framebuffer console and Xorg work.

But there is another problem with TV-out:
When turned on the TV output is in contrast with the LVDS output and set the
screen resolution of 720x576 on the console framebuffer.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
