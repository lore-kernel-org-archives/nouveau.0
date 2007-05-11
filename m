From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10858] glxgears with mesa-git on PCI 10de0322 (NV34)
	GeForce FX 5200 crashes X
Date: Fri, 11 May 2007 04:12:53 -0700 (PDT)
Message-ID: <20070511111253.E4B30130061@annarchy.freedesktop.org>
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





------- Comment #8 from mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-05-11 04:12 PST -------
Following marcheu's instructions (refer
http://lattice.u-strasbg.fr/irclogs/nouveau-2007-05-11) I commented line 808
and 809 out of mesa/src/mesa/drivers/dri/nouveau/nv30_state.c.

//      BEGIN_RING_SIZE(NvSub3D, 0x03b0, 1);
//      OUT_RING(0x00100000);

Now when I start gears I get the black window (no window decorations, but am
now running nude X) and things just sit there and seem to be quite happy.  Will
attach syslog and photo. 

Then when I click on a window either the terminal from which I started gears or
gears itself X crashes, now getting a new error in the syslog output, but is
this a different case is this trying to context switch? and gears is working
with no gears drawn?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
