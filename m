From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26577] [regression] Black screen with X on NV15 and
	NV31
Date: Mon, 15 Feb 2010 11:31:30 -0800 (PST)
Message-ID: <20100215193130.97DF61300A1@annarchy.freedesktop.org>
References: <bug-26577-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26577-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26577


Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[regression] Black screen   |[regression] Black screen
                   |with X on NV11 and NV31     |with X on NV15 and NV31




--- Comment #4 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2010-02-15 11:31:30 PST ---
I built it on openSUSE Build Service ("git pull" on 20100210) and installed it
on my system (with -debuginfo and -debugsource packages).

/usr/lib # nm /usr/lib/libdrm.so
nm: /usr/lib/libdrm.so: no symbols

/usr/lib # l *drm*
lrwxrwxrwx 1 root root    21 13. Feb 12:37 libdrm_intel.so ->
libdrm_intel.so.1.0.0*
lrwxrwxrwx 1 root root    21 13. Feb 12:31 libdrm_intel.so.1 ->
libdrm_intel.so.1.0.0*
-rwxr-xr-x 1 root root 42496 11. Feb 04:08 libdrm_intel.so.1.0.0*
lrwxrwxrwx 1 root root    23 13. Feb 12:37 libdrm_nouveau.so ->
libdrm_nouveau.so.1.0.0*
lrwxrwxrwx 1 root root    23 13. Feb 12:31 libdrm_nouveau.so.1 ->
libdrm_nouveau.so.1.0.0*
-rwxr-xr-x 1 root root 22064 11. Feb 04:08 libdrm_nouveau.so.1.0.0*
lrwxrwxrwx 1 root root    22 13. Feb 12:37 libdrm_radeon.so ->
libdrm_radeon.so.1.0.0*
lrwxrwxrwx 1 root root    22 13. Feb 12:31 libdrm_radeon.so.1 ->
libdrm_radeon.so.1.0.0*
-rwxr-xr-x 1 root root 17984 11. Feb 04:08 libdrm_radeon.so.1.0.0*
lrwxrwxrwx 1 root root    15 13. Feb 12:37 libdrm.so -> libdrm.so.2.4.0*
lrwxrwxrwx 1 root root    15 13. Feb 12:31 libdrm.so.2 -> libdrm.so.2.4.0*
-rwxr-xr-x 1 root root 42640 11. Feb 04:08 libdrm.so.2.4.0*


GeForce 2 GTS is NV15 - sorry ...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
