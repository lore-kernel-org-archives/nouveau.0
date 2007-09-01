From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12158] mouse cursor disappears
Date: Sat,  1 Sep 2007 02:32:09 -0700 (PDT)
Message-ID: <20070901093209.D8D2B13006E@annarchy.freedesktop.org>
References: <bug-12158-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12158-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12158


mjulien.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mjulien.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




------- Comment #2 from mjulien.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-09-01 02:32 PST -------
The problem was already present last year.

xf86-nouveau :
commit c64c55b3133221462980b934a308daf2cc0e473d
Author: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Date:   Sun Aug 27 09:56:36 2006 +1000

    remove all U0* types in favour of more standard CARD* types


drm :
commit fef9b30a2b437c0103c33443566604027529b91d
Author: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Date:   Sun Aug 27 08:55:02 2006 +1000

    initial import of nouveau code from nouveau CVS



I was unable to go before this commit, drm and nouveau failed to compile.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
