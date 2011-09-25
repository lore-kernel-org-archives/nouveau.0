From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40485] PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
 PROTECTION_FAULT
Date: Sun, 25 Sep 2011 13:55:25 -0700 (PDT)
Message-ID: <20110925205525.02EFC1300C6@annarchy.freedesktop.org>
References: <bug-40485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40485

--- Comment #11 from Dennis Schridde <devurandom-hi6Y0CQ0nG0@public.gmane.org> 2011-09-25 13:55:24 PDT ---
Created an attachment (id=51601)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=51601)
Xorg.0.log (after SIGKILL to X and restarting it)

P.S: killing X with sigkill results in this:

-- dmesg --
[drm] nouveau 0000:03:00.0: Failed to idle channel 1.
[drm] nouveau 0000:03:00.0: PGRAPH idle timed out with status 0x0bef0103
[drm] nouveau 0000:03:00.0: PGRAPH idle timed out with status 0x0bef0103
[drm] nouveau 0000:03:00.0: PGRAPH idle timed out with status 0x0bef0103
[drm] nouveau 0000:03:00.0: Setting dpms mode 3 on tmds encoder (output 1)
[drm] nouveau 0000:03:00.0: 0xC5B5: Parsing digital output script table
[drm] nouveau 0000:03:00.0: Setting dpms mode 0 on tmds encoder (output 1)
[drm] nouveau 0000:03:00.0: Output DVI-I-1 is running on CRTC 0 using output A

The screen flickers but stays black.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
