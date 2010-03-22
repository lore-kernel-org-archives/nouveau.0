From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27153] [NV18] Frequent lockups during graphical
	activities
Date: Mon, 22 Mar 2010 04:22:44 -0700 (PDT)
Message-ID: <20100322112244.CEBD51300A3@annarchy.freedesktop.org>
References: <bug-27153-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27153-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=27153





--- Comment #3 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-03-22 04:22:44 PST ---
Created an attachment (id=34310)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=34310)
nv18_pgraph_lockup.patch

The attached patch might help, in any case we don't have an mmiotrace for this
card yet and it would be useful if we want to fix it properly.

In short, you'd need to:
- Start tracing
- Load nvidia.ko and start X up with the nvidia proprietary driver
- Run some 3d for a few seconds (e.g. fire up glxgears)
- Stop tracing and send the generated output to mmio.dumps at gmail.com

It's explained in more depth here:
http://nouveau.freedesktop.org/wiki/MmioTrace
http://cgit.freedesktop.org/nouveau/linux-2.6/tree/Documentation/trace/mmiotrace.txt


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
