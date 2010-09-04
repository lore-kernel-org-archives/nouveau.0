From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29714] Corrupted image (running stripes) on Quadro
 NVS 3100M with embedded DisplayPort (HP EliteBook 8440p)
Date: Sat,  4 Sep 2010 06:50:18 -0700 (PDT)
Message-ID: <20100904135018.78EBD1300BC@annarchy.freedesktop.org>
References: <bug-29714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29714

--- Comment #16 from Yuriy Khomchik <homyur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-09-04 06:50:18 PDT ---
Suspicious strings from output of dmesg, possibly pointing to this problem:

...
[   13.904181] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   13.904944] [drm] nouveau 0000:01:00.0: plugged Embedded DisplayPort-1
[   13.906631] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   13.907431] [drm] nouveau 0000:01:00.0: plugged Embedded DisplayPort-1
[   14.018602] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   14.019357] [drm] nouveau 0000:01:00.0: plugged Embedded DisplayPort-1
[   14.019367] [drm] nouveau 0000:01:00.0: plugged Embedded DisplayPort-1
[   14.021106] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   14.021904] [drm] nouveau 0000:01:00.0: plugged Embedded DisplayPort-1
[   14.133016] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   14.133032] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   14.133799] [drm] nouveau 0000:01:00.0: plugged Embedded DisplayPort-1
[   14.135469] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   14.135478] [drm] nouveau 0000:01:00.0: unplugged Embedded DisplayPort-1
[   14.136267] [drm] nouveau 0000:01:00.0: plugged Embedded DisplayPort-1
...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
