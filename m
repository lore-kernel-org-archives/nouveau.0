From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35267] nouveau fails to load BIOS on EFI boot.
Date: Sun, 13 Mar 2011 12:06:47 -0700 (PDT)
Message-ID: <20110313190647.8A29D13000C@annarchy.freedesktop.org>
References: <bug-35267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35267

--- Comment #3 from hanfi <freedesktop.org-6Pg49yFQ+vvtRgLqZ5aouw@public.gmane.org> 2011-03-13 12:06:47 PDT ---
Ah, now after recompile the kernel with no nouveau and then install nvidia-blob
i get the same error as mentioned in the email at
http://lists.freedesktop.org/archives/nouveau/2010-September/006608.html

NVRM: failed to copy vbios to system memory.
NVRM: RmInitAdapter failed! (0x30:0xffffffff:832)
NVRM: rm_init_adapter(0) failed
NVRM: failed to copy vbios to system memory.
NVRM: RmInitAdapter failed! (0x30:0xffffffff:832)
NVRM: rm_init_adapter(0) failed
NVRM: failed to copy vbios to system memory.
NVRM: RmInitAdapter failed! (0x30:0xffffffff:832)
NVRM: rm_init_adapter(0) failed

looks like i got the same problem.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
