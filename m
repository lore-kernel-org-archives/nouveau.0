From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10858] glxgears with mesa-git on PCI 10de0322 (NV34)
	GeForce FX 5200 crashes X
Date: Sat, 19 May 2007 18:04:48 -0700 (PDT)
Message-ID: <20070520010448.7280F13006A@annarchy.freedesktop.org>
References: <bug-10858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10858





------- Comment #25 from mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-05-19 18:04 PST -------
Created an attachment (id=10035)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=10035&action=view)
kern.log from failure noted in comment 21

dog! looking in the wrong place, checks /var/log/kern.log

Looks like I am still seeing the error at offset 0x03b0 that started this all
off..... (no nv05) in the machine this time!!

May 20 12:40:50 angus kernel: [  263.060000] [drm:nouveau_pgraph_irq_handler]
*ERROR* NV: PGRAPH error interrupt
May 20 12:40:50 angus kernel: [  263.060000] [drm:nouveau_pgraph_irq_handler]
*ERROR* nsource:0x00040000^Instatus:0x01000000
May 20 12:40:50 angus kernel: [  263.060000] [drm:nouveau_pgraph_irq_handler]
*ERROR* instance:0x0000234e
May 20 12:40:50 angus kernel: [  263.060000] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: nSource: 0x00040000, nStatus: 0x01000000
May 20 12:40:50 angus kernel: [  263.060000] [drm:nouveau_graph_dump_trap_info]
*ERROR* NV: Channel 1/7 (class 0x0697) -Method 0x03b0, Data 0x00100000


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
