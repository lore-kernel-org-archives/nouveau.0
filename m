From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25952] GeForce 9800 GTX - nouveau_init takes ~ 1
 minute to complete
Date: Fri,  8 Jan 2010 12:17:00 -0800 (PST)
Message-ID: <20100108201700.7D27D130193@annarchy.freedesktop.org>
References: <bug-25952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25952





--- Comment #1 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-01-08 12:16:59 PST ---
nouveau 0000:01:00.0: firmware: requesting nouveau/nv92.ctxprog
[drm] nouveau 0000:01:00.0: No ctxprog for NV92

You need to install the firmware : pacman -S nouveau-firmware.
pacman should have informed you during installation as nouveau-firmware is an
optdepend.

I don't know why there is a 1 minute delay though, but without firmware, you
won't have any accel.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
