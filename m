From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29129] Cannot set refresh rate on nv50
Date: Sat, 17 Jul 2010 10:00:50 -0700 (PDT)
Message-ID: <20100717170051.6753A13012D@annarchy.freedesktop.org>
References: <bug-29129-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29129-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29129

--- Comment #2 from Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org> 2010-07-17 10:00:50 PDT ---
You're of course right, Ben, looks like I screwed up the last bisection step.
The actual change that introduced the buggy behavior was the previous one,
7f612d87f8b4b1ddbcee04264a93e5af7b9f21c7:

drm/nouveau: use dcb connector table for creating drm connectors

This makes this code common to both the nv04 and nv50 paths.

For the moment, we keep the previous behaviour with HDMI/eDP connectors
and report them as DVI-D/DP instead.  This will be fixed once the rest
of the code has been fixed to deal with those types.

Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


I refrain from including the 274 lines "git diff" output.

In dmesg I see the following messages:

[    0.896501] [drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[    0.896543] [drm] nouveau 0000:01:00.0: Detected a VGA connector
[    0.896570] [drm] nouveau 0000:01:00.0: Detected a TV connector

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
