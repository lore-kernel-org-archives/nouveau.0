From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29415] Screen shutdown with Nvidia GeForce 9400M
Date: Fri,  6 Aug 2010 01:48:54 -0700 (PDT)
Message-ID: <20100806084854.2AC65130120@annarchy.freedesktop.org>
References: <bug-29415-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29415-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29415

--- Comment #6 from Felix Leimbach <felix.leimbach-hi6Y0CQ0nG0@public.gmane.org> 2010-08-06 01:48:54 PDT ---
I'm seeing something similar on the exact same GPU (Macbook 13", late 2009) and
it might be the same bug:

When I connect an external monitor to the minidisplay-port=>DVI adapter then
the external monitor is detected but won't display anything (no signal).

This happens with nouveau-drm and xf86-video-nouvau from today's git. The same
setup worked with git from 2010-07-23 (see #29171).

dmesg after plugging and unplugging the external monitor a couple of times:

[drm] nouveau 0000:02:00.0: plugged DisplayPort-1
[drm] nouveau 0000:02:00.0: plugged DisplayPort-1
[drm] nouveau 0000:02:00.0: unplugged DisplayPort-1
[drm] nouveau 0000:02:00.0: plugged DisplayPort-1
[drm] nouveau 0000:02:00.0: plugged DisplayPort-1
[drm] nouveau 0000:02:00.0: unplugged DisplayPort-1
i2c i2c-1: sendbytes: error -110
[drm] nouveau 0000:02:00.0: DDC responded, but no EDID for DisplayPort-1
[drm] nouveau 0000:02:00.0: Couldn't find matching output script table
[drm] nouveau 0000:02:00.0: Couldn't find matching output script table
[drm] nouveau 0000:02:00.0: plugged DisplayPort-1
[drm] nouveau 0000:02:00.0: Couldn't find matching output script table
[drm] nouveau 0000:02:00.0: Couldn't find matching output script table
[drm] nouveau 0000:02:00.0: unplugged DisplayPort-1
[drm] nouveau 0000:02:00.0: plugged DisplayPort-1
[drm] nouveau 0000:02:00.0: plugged DisplayPort-1
[drm] nouveau 0000:02:00.0: plugged DisplayPort-1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
