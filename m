From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38301] drm: nouveau: *ERROR* Raw EDID
Date: Tue, 14 Jun 2011 08:12:10 -0700 (PDT)
Message-ID: <20110614151210.7ABF713004E@annarchy.freedesktop.org>
References: <bug-38301-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38301-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38301

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-06-14 08:12:09 PDT ---
Your system lock is caused (most likely) by the "Stuck in infinite loop
bug"[1], as the "ERROR Raw EDID" message is present from the start of nouveau
(i.e. not caused by the glxheads nor glxgears)

Please give the ddx driver[2] a try, as AFAIK the galluim-xorg driver is not
supported

Can you please state the exact kernel and mesa commit the logs are based on,
and I would suggest trying the git version of them (kernel-nouveau git [3] and
mesa [4])

For instructions of building and configuring your build please take a look here
[5]


Cheers

[1]
http://nouveau.freedesktop.org/wiki/TroubleShooting#Igetthe.22EQoverflowing.22error
[2] http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/
[3] http://cgit.freedesktop.org/nouveau/linux-2.6/
[4] http://cgit.freedesktop.org/mesa/mesa/
[5] http://nouveau.freedesktop.org/wiki/InstallNouveau

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
