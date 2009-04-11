From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16168] Quadro NVS 400 (NV17a) drm PGRAPH_ERROR
Date: Sat, 11 Apr 2009 12:19:19 -0700 (PDT)
Message-ID: <20090411191919.0CB49130058@annarchy.freedesktop.org>
References: <bug-16168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16168





--- Comment #7 from Pete Beardmore <elbeardmorez-uAjRD0nVeow@public.gmane.org>  2009-04-11 12:19:18 PST ---
hi.

i updated everything from git a couple of weeks ago.

i am still having the same problems with any kind of acceleration. kde (4 now)
sessions will just stop responding after up to a minute of usage. the gdb
outputs attached are hopefully helpful in showing the where the process is
hanging:

nouveau_fence_flush
nouveau_fence_wait

etc.

i tested X / KDE with less components each time. there are misleading??
messages generated in the xorg log about disabled components..

(WW) "glx" will not be loaded unless you've specified it to be loaded
elsewhere.
(WW) "dri" will not be loaded unless you've specified it to be loaded
elsewhere.
(II) "extmod" will be loaded. This was enabled by default and also specified in
the config file.
(II) "dbe" will be loaded. This was enabled by default and also specified in
the config file.
(II) "glx" will be loaded even though the default is to disable it.
(II) "dri" will be loaded even though the default is to disable it.
(II) "dri2" will be loaded by default.

..i explicitly checked that the various X modules weren't present in the
environment each time using xdpyinfo.

regardless, i think the stacks only look different because the hang occured
whilst doing different operations each time..

i've once again had to revert back to using ` Option "NoAccel" "true" ` to get
any type of stability.. ..on two monitors (see other issue
https://bugs.freedesktop.org/show_bug.cgi?id=16165)

is there anything I can do?

i tried using the 'isolateDevice' switch for the xserver thinking that maybe
the second gpu isn't helping, but since there's no mention of the other gpu
device in the log it was probably pointless - no change anyway.

cheers.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
