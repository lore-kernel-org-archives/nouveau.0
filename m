From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29133] Mesa 7.8.1 implementation error: bad format
	in do_row()
Date: Wed, 14 Sep 2011 05:28:46 -0700 (PDT)
Message-ID: <20110914122846.73BBE130212@annarchy.freedesktop.org>
References: <bug-29133-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29133-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29133

Corbin Simpson <MostAwesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|unspecified                 |7.8
          Component|Drivers/DRI/nouveau         |Mesa core
         AssignedTo|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org
                 CC|                            |MostAwesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Corbin Simpson <MostAwesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-14 05:28:45 PDT ---
Triaging. These kinds of errors are almost universally bugs in Mesa core;
reassigning.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
