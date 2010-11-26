From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30842] G84M/NVS 140M GPU Lockup
Date: Fri, 26 Nov 2010 12:52:41 -0800 (PST)
Message-ID: <20101126205241.E50C213004D@annarchy.freedesktop.org>
References: <bug-30842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30842-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30842

--- Comment #3 from nox <noxdafox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-11-26 12:52:40 PST ---
notebook: Lenovo Thinkpad r61 with NVIDIA Quadro nvs 140m G84m
system: Debian squeeze/sid
kernel: 2.6.35-amd64
nouveau version (from Debian experimental repos): xserver-xorg-video-nouveau
v.1:0.0.16+git20100825+390f1c8-1

I suffer the same issue, X locks randomly during KDE sessions. Keyboard and
input system not responding.

I noticed this on dmesg when the problem occurs:
[13627.748754] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2
[13627.749967] [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR - Ch 2/0 Mthd
0x0000 Data 0x03000000
[13627.749979] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
