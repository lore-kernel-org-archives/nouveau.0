From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40406] Nouveau NVIDIA NV46: Freeze
Date: Wed, 28 Sep 2011 12:52:07 -0700 (PDT)
Message-ID: <20110928195207.21D1313007B@annarchy.freedesktop.org>
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

--- Comment #10 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-28 12:52:05 PDT ---
(In reply to comment #9)
> Hi Emil,
> 
> thanks for your reply.
> 
> Actually, it try that every time, but a SYSRQ-SYNC locks the system completely.
> The syslog file was the only file I could save on harddisk so far.
Now that sounds unusual, any chance of a serial console?

> 
> And thanks for the hint. I didn't realize that NV30-NV40 indicates the families
> and not the code names.
> 
> I am just asking, because I haven't found information about the why: why should
> I not file bug reports? Because the cards are too old and you gave up
> fixing/improving the nvfx driver? Because you are working on it?

A number of people have worked on the 3d/mesa/gallum driver for nv30/40

The latest person Luca Barbieri (lb1) did quite an impressive/substantial work
but vanished after that.
Since then no one has stepped in to develop/bugfix (with some exceptions) that
code, thus the lack of support

Sorry

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
