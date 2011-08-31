From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35876] Hard GPU hangs on NV86
Date: Tue, 30 Aug 2011 18:56:37 -0700 (PDT)
Message-ID: <20110831015638.3F7311300D5@annarchy.freedesktop.org>
References: <bug-35876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35876-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35876

--- Comment #28 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-08-30 18:56:38 PDT ---
Back to the hangs caused by unegine demos. I reproduced that once more without
my patch of course.

I got:

[10459.780042] [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail:
0x00c00603 0x0000014d 0x00005600 0x00000000
[10464.810946] [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail:
0x00c00603 0x0000014d 0x00005600 0x00000000
[10469.826439] [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail:
0x00c00603 0x0000014d 0x00005600 0x00000000
[10474.841967] [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail:
0x00c00603 0x0000014d 0x00005600 0x00000000
[10479.770036] [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail:
0x00c00603 0x0000014d 0x00005600 0x00000000

In kernel log. PFIFO appears to be idle, and PGRAPH hung, while its MPs appear
active.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
