From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36416] External monitor connected to docking station
 gets no signal, although recognized
Date: Thu, 28 Jul 2011 04:43:32 -0700 (PDT)
Message-ID: <20110728114332.8E2401304DF@annarchy.freedesktop.org>
References: <bug-36416-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36416-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36416

--- Comment #5 from David Schoen <neerolyte-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-07-28 04:43:30 PDT ---
(In reply to comment #4)
> Can you mail the vbios image from /sys/kernel/debug/dri/0/vbios.rom ("mount -t
> debugfs debugfs /sys/kernel/debug" if not already done) to
> mmio.dumps-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, and mention this bug number in the subject.

I'm experiencing the same bug, the second monitor does function via the
proprietary nvidia driver and if I switch the DVI connections to both monitors
the one that's stating no signal swaps around with nouveau, so I don't suspect
any hardware faults.

I've posted my vbios.rom here:
http://lyte.id.au/stuff/vbios.rom.gz

I can email it directly as well if required...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
