From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38992] GeForce 9500 GT: starts only with
	nouveau.noaccel=1
Date: Wed,  6 Jul 2011 01:16:50 -0700 (PDT)
Message-ID: <20110706081658.9639613004D@annarchy.freedesktop.org>
References: <bug-38992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=38992

Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Product|Mesa                        |xorg
          Component|Drivers/DRI/nouveau         |Driver/nouveau
          QAContact|                            |xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

--- Comment #1 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2011-07-06 01:16:28 PDT ---
Please, provide complete kernel and X logs as instructed in
http://nouveau.freedesktop.org/wiki/Bugs
for the black screen and segfault case.

Note, that while your aim may be 3D acceleration, your problem is not a Mesa or
3D bug. When working on the black screen issue, please remove the 3D driver
(nouveau_dri.so, which belongs to Mesa) to reduce the possible points of
failure.

Noaccel disables all 2D and 3D acceleration, and is merely a workaround to get
to the desktop.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
