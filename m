From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27720] Hard Hang on suspend - 8600M GS
Date: Tue, 20 Apr 2010 19:38:30 -0700 (PDT)
Message-ID: <20100421023830.698E9130011@annarchy.freedesktop.org>
References: <bug-27720-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27720-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27720

--- Comment #6 from Jim Bray <jimsantelmo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-20 19:38:30 PDT ---
Created an attachment (id=35192)
 View: https://bugs.freedesktop.org/attachment.cgi?id=35192
 Review: https://bugs.freedesktop.org/review?bug=27720&attachment=35192

Very crude hacks that appear to sort of work

  I have done some printk-debugging, and come up with some preliminary results
and a patch that works in my minimal testbed kernel, suspending the fb-console
in single-user and resuming multiple times. It appears that
acquire_console_sem() may be hanging things, and it is pretty clear that one or
more of the pci calls, such as pci_set_power_state(pdev, PCI_D3hot), are
hanging. I'll see if this works multi-user suspending from X.

  This is *not* recommended as a patch, just as an indication of where the
problems may lie.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
