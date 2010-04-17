From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27706] Blank screen and "Error referencing VRAM
 ctxdma: -12" on NV44A with ubuntu lucid beta 2 (worked in alpha 3)
Date: Sat, 17 Apr 2010 04:58:49 -0700 (PDT)
Message-ID: <20100417115849.4220613005E@annarchy.freedesktop.org>
References: <bug-27706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27706

--- Comment #16 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-17 04:58:48 PDT ---
Before you start bisecting:
video=vga16fb:off does not work because in Ubuntu vga16fb is compiled as module
and kernel parameters does not affect it - you have to blacklist it by hand.
There's "vga16fb: not registering due to another framebuffer present" (which is
Ubuntu addon) in kernel log so it should not load it, BUT it exercises broken
failure path in vga16fb which is iounmapping memory region which was not
ioremapped by vga16fb (VGA_MAP_MEM is defined differently on different
architectures - on x86 it's NOT ioremap), so it might affect nouveau - I need
to investigate it more.

In reply to comment 13:
IIRC Fedora does not enable vga16fb, so:
- it might be diffent bug
- this bug is not related to vga16fb at all

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
