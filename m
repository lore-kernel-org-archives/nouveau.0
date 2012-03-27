From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39980] freezing nouveau
Date: Tue, 27 Mar 2012 02:47:35 +0000
Message-ID: <bug-39980-8800-TYGqdtTCBh@http.bugs.freedesktop.org/>
References: <bug-39980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39980

--- Comment #6 from Christoph Anton Mitterer <calestyo-Jy7UQHNrZ9Pk1uMJSBkQmQ@public.gmane.org> 2012-03-26 19:47:35 PDT ---
This still persists basically.

Now with:
Linux 3.2.12
libgl1-mesa-dri/libgl1-mesa-glx 7.11.2-1
libdrm-nouveau1a 2.4.32-1
xserver-xorg-video-nouveau 1:0.0.16+g


One thing I've noticed:
It's possible to see the problems approaching (even when not looking at the
kernel output)...
The screen starts to flicker (especially when switching virtual desktops, due
to the compiz animation stuff) in some areas,.. if you then continue to work it
will usually freeze.
I've also noticed that closing windows (e.g. some terminals) usually helps then
and also stops the flickering.

When the freeze however happens, one has now usually a few seconds time to
Ctrl+Alt+F1 to the console and Ctrl+Alt+Enf or ACPI Power Button Event.
Thereby you at least shut down cleanly though still loosing all your work.

:-(

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
