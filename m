From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23495] nouveau KMS produces no output on a Dell
	3008WFP monitor
Date: Mon, 24 Aug 2009 23:27:59 -0700 (PDT)
Message-ID: <20090825062800.9DBD6130058@annarchy.freedesktop.org>
References: <bug-23495-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23495-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23495





--- Comment #3 from Wil <wil.reichert-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-08-24 23:27:54 PST ---
Loading the nouveau module with duallink=0 allowed me to boot into a 1920x1200
framebuffer console.  I reconfigured my system to use the nvidia binary driver
& get an mmiotrace.  Steps I followed:

rmmod'd the nvidia kernel
disabled all but 1 core
echo'd mmiotrace to current_tracer
started the cat on trace_pipe
ran startx & loaded openbox @ 2560x1600
echo'd "X is up" to trace_marker
echo'd nop into current_tracer

trace emailed to mmio dot dumps mentioned on the MmioTraceHowto page


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
