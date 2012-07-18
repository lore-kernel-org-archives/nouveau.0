From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51962] Raz's eyes flicker in Psychonauts on nv50
Date: Wed, 18 Jul 2012 11:59:50 +0000
Message-ID: <bug-51962-8800-7uLXUPzarX@http.bugs.freedesktop.org/>
References: <bug-51962-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51962-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51962

--- Comment #2 from Bryan Cain <bryancain3+fdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-07-18 04:59:50 PDT ---
I did some more investigation into this bug and produced a fix:
http://lists.freedesktop.org/archives/mesa-dev/2012-July/024196.html

The problem was that in lowering the POW instruction, the lg2/mul/preex2
instructions that go before the ex2 instruction were not being emitted
properly, which as a side effect made each of the four ex2 instructions in the
shader read from an undefined source register.  This in turn made the SSA
generator produce 4 of the 5 nop instructions mentioned in the original
description.

The first of the five nop instructions is not the nv50 shader compiler's fault,
but is the result of the GLSL compiler's pass to lower output registers
emitting reads to undefined components of gl_TexCoord.  It's an unrelated issue
that happened to show up in the same shader, and doesn't affect the shader at
the driver level post-optimization.  I will file a separate bug report about it
against glsl-compiler.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
