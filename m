From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28449] I messed up and now nouveau doesn't work.
Date: Tue,  8 Jun 2010 11:53:07 -0700 (PDT)
Message-ID: <20100608185307.B96B31300A9@annarchy.freedesktop.org>
References: <bug-28449-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28449-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28449

--- Comment #4 from David Ronis <David.Ronis-BAnzPxqWUM23NexWsGEg3A@public.gmane.org> 2010-06-08 11:53:07 PDT ---
I added the patch and reinstalled.  I get further, but now I see:

EE) NOUVEAU(0): Output position loop. Moving VGA-1 to 0,0
(EE) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed
(/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
(EE) AIGLX: reverting to software rendering
X: ../../../include/privates.h:122: dixGetPrivateAddr: Assertion
`key->initialized' failed.

It looks like nouveau_dri is in mesa, and is enabled by
--enable-gallium-nouveau.  I've enabled it and am trying again (this wasn't
necessary in the past).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
