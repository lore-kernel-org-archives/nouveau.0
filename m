From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21869] Chroma mismatch using XV
Date: Sat, 30 May 2009 05:11:09 -0700 (PDT)
Message-ID: <20090530121109.29812130016@annarchy.freedesktop.org>
References: <bug-21869-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21869-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21869





--- Comment #16 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-05-30 05:11:07 PST ---
I confirm this problem with nv28. Xv port "NV Video Overlay" suffers it, "NV
Video Blitter" is fine.

I've been watching TV with gxine and some time in the past it started to look
like there was something lagging with colors, especially certain red and blue
hues. I didn't pinpoint it then, but this bug is the problem.

My Nouveau installation is still quite old, March 27th.

Thanks for the test case! For instance, when the red buttons light up in the
beginning, they start white and turn red on the next frame. Without the bug
they become red from the beginning. Later, when the red hands move, the chroma
and luma are clearly "out of sync" every other frame: pale hands have a red
"shadow".


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
