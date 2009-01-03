From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19356] DPMS does not turn off LCD backlight on NV34M
 [ GeForce FX Go5200]
Date: Sat,  3 Jan 2009 08:45:01 -0800 (PST)
Message-ID: <20090103164501.BBA79130057@annarchy.freedesktop.org>
References: <bug-19356-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19356-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19356





--- Comment #7 from Danny <moondrake-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-01-03 08:44:59 PST ---
Lets first check the ppc specific hack we have now. Can you install radeontool:

git clone git://people.freedesktop.org/~airlied/radeontool
git checkout origin/nvidia
make (if there's problems with the asm/page.h include, comment it out)

then examine the contents of the following 2 regs:
./radeontool regmatch 0x0060081c
./radeontool regmatch 0x000010f0

under both nv and nouveau, with panel off and panel on (to get the reg during
panel off you can try an ssh connection from another machine, or maybe xset
dpms force off;sleep 5; ./radeontool regmatch 0x000010f0
or something like that.

d.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
