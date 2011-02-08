From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33999] 2.6.37 - NV11 crashes X if glxgears started
Date: Mon,  7 Feb 2011 18:12:10 -0800 (PST)
Message-ID: <20110208021210.AEB3113004D@annarchy.freedesktop.org>
References: <bug-33999-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33999-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33999

--- Comment #6 from Alex Buell <alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org> 2011-02-07 18:12:08 PST ---
I managed to get a backtrace:

Program received signal SIGSEGV, Segmentation fault.
0xb72d7821 in nouveau_dri2_create_buffer (pDraw=0x845e918, attachment=1,
format=0) at nouveau_dri2.c:72
72    nouveau_dri2.c: No such file or directory.
    in nouveau_dri2.c
(gdb) bt
#0  0xb72d7821 in nouveau_dri2_create_buffer (pDraw=0x845e918, attachment=1,
format=0) at nouveau_dri2.c:72
#1  0xb7327935 in ?? () from /usr/lib/xorg/modules/extensions/libdri2.so
#2  0xb7329ca0 in ?? () from /usr/lib/xorg/modules/extensions/libdri2.so
#3  0x08071e7f in Dispatch () at dispatch.c:432
#4  0x0806577a in main (argc=6, argv=0xbfbd3824, envp=0xbfbd3840) at main.c:291

The offending line of code that caused the crash is:

    nouveau_bo_handle_get(nouveau_pixmap(ppix)->bo, &nvbuf->base.name);

I'm not sure why it's crashing at this point but my guess is that it's probably
the ->bo that might be the cause. I'd be glad to help track the cause down. I
just need some input on how to proceed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
