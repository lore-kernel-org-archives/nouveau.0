From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25824] KMS, Dualhead: Strange bigger console
Date: Wed, 30 Dec 2009 02:26:30 -0800 (PST)
Message-ID: <20091230102631.C6EB41300A3@annarchy.freedesktop.org>
References: <bug-25824-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25824-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25824





--- Comment #4 from Achim Schaefer <achim_schaefer-Mmb7MZpHnFY@public.gmane.org>  2009-12-30 02:26:29 PST ---
(In reply to comment #3)
> Case 2 you should be able to achieve with the "video" kernel command line
> parameter, forcing the small mode on the big monitor. I hope it is documented
> in the kernel Documentation, since I do not recall the correct syntax.
That depends if nouveau driver uses modedb or not.

from Documentation/fb/modedb.txt
  Drivers that support modedb boot options
123     Boot Name     Cards Supported
124
125     amifb       - Amiga chipset frame buffer
126     aty128fb    - ATI Rage128 / Pro frame buffer
127     atyfb       - ATI Mach64 frame buffer
128     pm2fb       - Permedia 2/2V frame buffer
129     pm3fb       - Permedia 3 frame buffer
130     sstfb       - Voodoo 1/2 (SST1) chipset frame buffer
131     tdfxfb      - 3D Fx frame buffer
132     tridentfb   - Trident (Cyber)blade chipset frame buffer
133     vt8623fb    - VIA 8623 frame buffer

But here you can not find nouveau.

So either a new doc gets created with the options to handle this, or this doc
gets updated  including nouveau.
I hope with staging drivers you are allowed to change the existing docs-)

=> I assume I'll close this bug, and open a documentation bug?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
