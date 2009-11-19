From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11993] Native YV12 overlay bandwidth problems
Date: Thu, 19 Nov 2009 13:15:26 -0800 (PST)
Message-ID: <20091119211526.2D442130070@annarchy.freedesktop.org>
References: <bug-11993-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-11993-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11993


Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|arthur.huillet-dFvTVMYgtfk@public.gmane.org      |nouveau-PD4FTy7X32lNgt0PjOBp9/EVdHwE84te@public.gmane.org
                   |                            |g
             Status|ASSIGNED                    |NEW




--- Comment #3 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-11-19 13:15:25 PST ---
status update via irc:

< curro__> heh, nv1x bandwidth problems, that code is a bit broken
< curro__> it seems it did the calculations as if there was always just a
single CRTC scanning out
< curro__> i workarounded it on 5603fe7f92d6b06c87f48007989ec1d66d3258bc by
making it assume a worst case scenario
< curro__> it probably fixed that bug too
< pq> heh, ahuillet, can you re-test? :-)
< ahuillet> pq : I cannot test any longer
< ahuillet> I don't have a working NV1x setup
< curro__> pq: he would have to backport the fix to UMS
< curro__> pq: anyways i don't think my fix is the right thing to do
< curro__> but i haven't found the time to rework that bandwidth code

Reassigning to bug defaults.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
