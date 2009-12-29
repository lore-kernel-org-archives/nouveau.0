From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21536] Accelerated 2D Does Not Work On HP tx2000z
 (Geforce 6150 Go)
Date: Tue, 29 Dec 2009 01:34:07 -0800 (PST)
Message-ID: <20091229093408.07E101300C3@annarchy.freedesktop.org>
References: <bug-21536-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21536-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21536





--- Comment #5 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-12-29 01:34:06 PST ---
I believe it would be beneficial to
1. install the latest git version of DRM modules, libdrm and DDX (the X driver)
2. use the minimalistic xorg.conf from
http://nouveau.freedesktop.org/wiki/InstallNouveau
3. Use KMS (enabled by default nowadays)
4. provide a full kernel log from boot up to the GPU lockup, and X log

Step 1 probably requires you to upgrade your kernel to at least 2.6.32 for the
DRM modules to build.

It seems you have two nvidia devices, according to your X log. The kernel log
should give more information if that is a problem. Related to this, IIRC the
latest DRM code contains changes in multi-device support, although it is not
complete.

If this is too much, you should at least provide the kernel log.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
