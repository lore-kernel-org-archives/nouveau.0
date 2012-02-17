From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] nVidia 9600M GT (Macbook Pro current model)
 is unable to boot
Date: Fri, 17 Feb 2012 11:11:41 +0000
Message-ID: <bug-27501-8800-MpGI6WM8qL@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #17 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> 2012-02-17 03:11:41 PST ---
> Mateusz, how did you disable the 9600GT?
I am not Mateusz, but I have succeeded in getting nouveau working without any parameters working by deactivating 9600M GT with gpupwr and loading nouveau
afterwards.

Otherwise my system crashes and the last message which is send to my central syslog-server is:

2012-02-16 10:23:00    kernel  [drm] nouveau 0000:02:00.0: PRAMIN flush timeout
2012-02-16 10:23:00    kernel    [drm] nouveau 0000:02:00.0: PFIFO_INTR 0x04000000 - Ch 1
2012-02-16 10:23:00    kernel    [drm] nouveau 0000:02:00.0: PRAMIN flush timeout
2012-02-16 10:23:00    kernel    [drm] nouveau 0000:02:00.0: PFIFO_INTR 0x04000000 - Ch 1
2012-02-16 10:23:00    kernel    [drm] Cannot find any crtc or sizes - going 1024x768
2012-02-16 10:23:00    kernel    No connectors reported connected with modes
2012-02-16 10:23:00    kernel    [drm] No driver support for vblank timestamp query.
2012-02-16 10:23:00    kernel    [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
2012-02-16 10:23:00    kernel    [drm] nouveau 0000:02:00.0: PRAMIN flush timeout
2012-02-16 10:23:00    kernel    [drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
2012-02-16 10:23:00    kernel    [drm] nouveau 0000:02:00.0: Detected 256MiB VRAM
2012-02-16 10:23:00    kernel    [TTM] Initializing pool allocator.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
