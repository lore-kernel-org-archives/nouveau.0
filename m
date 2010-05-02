From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27928] Nouveau / Mesa sometimes gets libraries
	overwritten
Date: Sun,  2 May 2010 03:15:23 -0700 (PDT)
Message-ID: <20100502101523.6E69B13004E@annarchy.freedesktop.org>
References: <bug-27928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27928

--- Comment #1 from Alex Buell <alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org> 2010-05-02 03:15:23 PDT ---
This morning, libXxf86vm.so.1.0.0 was corrupted; there was this in the logs:

May  2 00:26:25 lithium kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO
number 3
May  2 00:26:25 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_alloc: initialised FIFO 3
May  2 00:26:25 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_free: freeing fifo 3
May  2 00:26:25 lithium kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO
number 3
May  2 00:26:25 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_alloc: initialised FIFO 3
May  2 00:26:25 lithium kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_free: freeing fifo 3

Killing gnome-screensaver, and recompiling libXxf86vm and gnome-screensaver
restored proper action. 

This is getting very strange indeed. Any ideas?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
