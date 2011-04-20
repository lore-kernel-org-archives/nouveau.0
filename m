From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36422] unable to hibernate with nouveau and NV11
	[bisected]
Date: Wed, 20 Apr 2011 16:00:36 -0700 (PDT)
Message-ID: <20110420230036.C3A5F13000C@annarchy.freedesktop.org>
References: <bug-36422-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36422-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36422

--- Comment #2 from c sights <csights-97jfqw80gc6171pxa8y+qA@public.gmane.org> 2011-04-20 16:00:35 PDT ---
(In reply to comment #1)
> I probably can't help you with hibernation bug, but if you would post a compile
> error I could provide a patch or workaround, so you could continue bisecting
> this.

  CC [M]  drivers/gpu/drm/nouveau/nouveau_drv.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_state.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_channel.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_mem.o
  CC [M]  drivers/gpu/drm/nouveau/nouveau_object.o
drivers/gpu/drm/nouveau/nouveau_object.c: In function 'nouveau_gpuobj_new':
drivers/gpu/drm/nouveau/nouveau_object.c:236:23: error: 'struct drm_mm' has no
member named 'ml_entry'
make[4]: *** [drivers/gpu/drm/nouveau/nouveau_object.o] Error 1
make[3]: *** [drivers/gpu/drm/nouveau] Error 2
make[2]: *** [drivers/gpu/drm] Error 2
make[1]: *** [drivers/gpu] Error 2
make: *** [drivers] Error 2


> Please attach dmesg from last known good and first bad kernel.
> Dmesg from .39-rcX might be useful too.

I'll attach these later....

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
