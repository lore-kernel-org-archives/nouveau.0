From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38687] Wrong resolution on LCD TV's
Date: Mon, 27 Jun 2011 11:22:14 -0700 (PDT)
Message-ID: <20110627182214.496FF13004D@annarchy.freedesktop.org>
References: <bug-38687-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38687-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38687

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-06-27 11:22:13 PDT ---

AFAIK nvidia's binary driver detects the supported resolutions irrespectively
of X

Thus I do not believe it's X infrastructure related

Now if we consider the case
"nouveau sets 800x600 upon boot, whereas nvidia does 1024x768"

You can clearly see that this is _not_ the case by looking at your log
"...nouveau 0000:01:00.0: allocated 1024x768..."

Nevertheless your Xorg.0.log should provide you with list of all the
resolutions parsed from the tv/monitor's EDID block

Note that if for some reason the EDID block fetched under Linux differs from
the one under windows, that would explain your issue.

If you prefer to use nouveau I highly recommend using more recent(latest git)
components [1][2][3]


Emil

[1] http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/
[2] http://cgit.freedesktop.org/mesa/drm/
[3] http://cgit.freedesktop.org/nouveau/linux-2.6/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
