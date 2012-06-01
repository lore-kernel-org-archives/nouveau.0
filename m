From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50571] nouveau crashes with GeForce GT 520
Date: Fri, 01 Jun 2012 07:27:50 +0000
Message-ID: <bug-50571-8800-OapnNslzoj@http.bugs.freedesktop.org/>
References: <bug-50571-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50571-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50571

--- Comment #2 from Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-06-01 00:27:50 PDT ---
More details from http://bugs.debian.org/675302:

1. Starting and using X with the fbdev driver works fine.

2. "startx /usr/bin/xterm" to start a minimal X session using the nouveau
driver freezes, too.

| Now tried running startx /usr/bin/xterm with nouveau,
| 
| [   82.427553] [drm] nouveau 0000:01:00.0: PDISP: DCB for 6/0xbad00103 not
found
| [   82.428536] [drm] nouveau 0000:01:00.0: PDISP: DCB for 0/0xbad00103 not
found
| [   82.429483] [drm] nouveau 0000:01:00.0: Table 0x0103 not found for 0/2,
using first
|
| I kept a previously opened ssh connection.
| When starting X, the screen went black, but didn't totally lock up until
| I killed the X process from SSH. No further netconsole output, the
| machine went totally dead.

3. This is a regression.

| A while back (like around linux 3.0.0) nouveau and gnome 2.30 did work 
| on this same machine

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
