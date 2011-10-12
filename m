From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40406] Nouveau NVIDIA NV46: Freeze
Date: Wed, 12 Oct 2011 00:38:39 -0700 (PDT)
Message-ID: <20111012073839.69C981300DB@annarchy.freedesktop.org>
References: <bug-40406-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40406-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40406

--- Comment #31 from Marco <marco-w08N04152XNe4xh82S9ftw@public.gmane.org> 2011-10-12 00:38:39 PDT ---
(In reply to comment #30)
> The oops seems to be unrelated to nouveau. I think it has something to do with
> use of 32-bit kernel and HIGHMEM - please report it to bugzilla.kernel.org or
> LKML.

Ok. I am going to wait for 3.1 vanilla and try that first. If the bug resists,
I will report it. Or I might temporarily switch to the nvidia driver.

But I am not 100% convinced that it is unrelated to nouveau. I am aware that
the following points can also be an indicator for a bug of the kernel, but
nevertheless, I want to summarize:

a) I receive lots of messages like

Oct  3 16:42:12 localhost kernel: [147178.508173] [drm] nouveau 0000:01:00.0:
PGRAPH - ERROR nsource: ILLEGAL_MTHD nstatus: PROTECTION_FAULT
Oct  3 16:42:12 localhost kernel: [147178.508185] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 0 (0x000c3000) subc 3 class 0x0039 mthd 0x0bf8 data 0x00100008

after suspend2ram/suspend2disk. So far, the kernel oops only occurred after
these messages.

b) Not every black screen led to a kernel oops. Sometimes, I can restart my
computer without seeing what I am typing.

c) The kernel oops is not always the same. 2 examples:
IP: [<c10c828e>] shrink_icache_memory+0x1bd/0x236
IP: [<c10c5006>] iput+0x32/0x106

d) The Xorg server and the dri driver strongly influence the behavior.

e) I haven't seen this bug before I started using nouveau.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
