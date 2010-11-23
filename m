From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24002] PFIFO_CACHE_ERROR PGRAPH_ERROR
Date: Tue, 23 Nov 2010 08:29:44 -0800 (PST)
Message-ID: <20101123162944.4635E13004D@annarchy.freedesktop.org>
References: <bug-24002-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24002-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=24002

--- Comment #1 from Robert Kaiser <kairo-mUdhYT1RRAM@public.gmane.org> 2010-11-23 08:29:44 PST ---
I'm seeing similar symptoms with openSUSE Factory, kernel 2.6.37-rc2, and a
GeForce 7600 GT (NV4B) card, though it looks like kernel messages vary when the
screen gets garbled, only the mouse pointer is still reacting (not that it
would do any good) and Xorg hangs at 100% of one CPU.

Xorg.log doesn't have anything of interest, but one recent set of kernel
messages seems to match what has been reported in this bug:

Nov 23 13:12:58 robert kernel: [  473.423531] [drm] nouveau 0000:01:00.0:
PGRAPH_ERROR - nSource: DATA_ERROR, nStatus: BAD_ARGUMENT
Nov 23 13:12:58 robert kernel: [  473.423539] [drm] nouveau 0000:01:00.0:
PGRAPH_ERROR - Ch 1/7 Class 0x0039 Mthd 0x0188 Data 0x00000000:0x00007a00
Nov 23 13:12:58 robert kernel: [  473.423552] [drm] nouveau 0000:01:00.0:
PGRAPH_ERROR - nSource: DMA_W_PROTECTION, nStatus: BAD_ARGUMENT
PROTECTION_FAULT
Nov 23 13:12:58 robert kernel: [  473.423557] [drm] nouveau 0000:01:00.0:
PGRAPH_ERROR - Ch 1/7 Class 0x0039 Mthd 0x0328 Data 0x00000000:0x00000000

At other times I get other errors in kernel messages with the same symptom.
Logging into the machine via ssh and rebooting works to get things back. Busy
I/O and opening windows/popups in KDE seems to make the failure more likely.
After a number of those problems (usually in the first minutes of KDE being up)
and reboots I happen to get a session that works flawlessly for hours,
including all kinds of window/popup opening and KDE compositing effects.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
