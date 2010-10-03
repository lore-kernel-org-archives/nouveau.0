From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24092] X with nouveau hangs in nouveau_bo_map_range
 when doing anything
Date: Sat,  2 Oct 2010 19:39:41 -0700 (PDT)
Message-ID: <20101003023941.6E72F13000D@annarchy.freedesktop.org>
References: <bug-24092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=24092

Aleksi Torhamo <alexerion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #6 from Aleksi Torhamo <alexerion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-10-02 19:39:41 PDT ---
I decided to test if the current nouveau works for me - and it does, perfectly.
Much lighter on the processor when watching videos, than the nvidia driver.

Not sure if it was my hardware, the kernel, nouveau, or something else, but if
I'd have to pick, I'd say hardware; At one point I decreased the memory speed
from BIOS after noticing that the motherboard (which supports DDR2-667) had
apparently decided to use the memory at 800MHz, which sounds like the kind of
thing that could have caused the whole thing. When I was first trying to get
nouveau to work, I hadn't even thought looking there, since the problem was
dependent on the software I was running..

All in all, one more happy user of nouveau.
Many thanks to all the developers for an excellent driver.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
