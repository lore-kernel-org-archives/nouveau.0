From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39498] nouveau hangs on unresponsive black screen at
	startup
Date: Sun, 24 Jul 2011 16:10:57 -0700 (PDT)
Message-ID: <20110724231057.305941301C7@annarchy.freedesktop.org>
References: <bug-39498-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39498-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39498

--- Comment #15 from Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org> 2011-07-24 16:10:55 PDT ---
Felix, just a quick comment on your logs. I am no expert at all, but I noticed
something:

- xserver is trying to load the "nvidia" driver (binary driver from NVidia) and
fortunately it's failing to load it because it's missing (otherwise it might
conflict with nouveau); lsmod should not show that "nvidia" kernel module is
loaded; Xorg.log should not show that it is trying to load nvidia_drv.so
- xserver is loading the "nv" driver (successfully) and that could interfere
with nouveau. you should avoid loading that. use 'Driver "nouveau"' in
xorg.conf or otherwise remove the file nv_drv.so from
/usr/lib/xorg/modules/drivers.

Summing up, only the following drivers/modules should be loaded when using
nouveau:

- kernel module (check with lsmod): nouveau, drm, drm_kms_helper, ttm
- Xorg module (check from Xorg.log):
/usr/lib/xorg/modules/drivers/nouveau_drv.so

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
