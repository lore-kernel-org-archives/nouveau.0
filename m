From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30482] Xf86-driver-nouveau build broken because of
 change to xserver
Date: Wed,  6 Oct 2010 06:11:34 -0700 (PDT)
Message-ID: <20101006131134.A077F13000D@annarchy.freedesktop.org>
References: <bug-30482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30482-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30482

--- Comment #2 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> 2010-10-06 06:11:34 PDT ---
Happens also on x86-32:

make[2]: Entering directory `/home/guest/source/xf86-video-nouveau/src'
  CC     drmmode_display.lo
drmmode_display.c: In function 'drmmode_xf86crtc_resize':
drmmode_display.c:1076: error: 'struct _ScrnInfoRec' has no member named
'pixmapPrivate'
make[2]: *** [drmmode_display.lo] Error 1
make[2]: Leaving directory `/home/guest/source/xf86-video-nouveau/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/guest/source/xf86-video-nouveau'
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
