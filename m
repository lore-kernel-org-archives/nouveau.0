From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53519] Missing bits of geometry in Unigine tropics
Date: Wed, 15 Aug 2012 01:03:59 +0000
Message-ID: <bug-53519-8800-OuS6i8krJe@http.bugs.freedesktop.org/>
References: <bug-53519-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-53519-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=53519

--- Comment #1 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2012-08-15 01:03:59 UTC ---
To reproduce I set the 'export NV50_PROG_OPTIMIZE=1'
because otherwise bugs in nouveau shader compiler cause severe misrenderings

Then you notice that random bits of the scenery appear and disappear randomly.
I bisected this issue to commit
'mesa,vbo: properly detect when vertex arrays need to be recalculated'

However, further commits appear to also break rendering in similar way.
To restore the functionality, I had to revert 6 commits:

fb4a34e60eb4c1bdc7b0fdcd98d1bf3038c354e8
'mesa: set _NEW_VARYING_VP_INPUTS flag only if fixed-func VP is enabled &
valid'

6fc565a94bc0de7ad617c28db7b8b6dfa4102d49
'"vbo: do FLUSH_CURRENT before validating and updating state'

576c8c592a4be7047a00b0c8fe3851b09f10d8d4
'mesa: add _NEW_VARYING_VP_INPUTS for gl_context::varying_vp_inputs'

b0e048f0b955ef79e2de794172de053d27d7d8fa
'mesa: move gl_array_attrib::NewState to gl_array_object::NewArrays'

81afdd20f3f574ce29559d8ad77df5c77652009e
'vbo: don't check twice whether it's valid to render'

784dd51198433e5c299da4a7742c68d21d68d1c1
'mesa,vbo: properly detect when vertex arrays need to be recalculated'

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
