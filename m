From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14856] Black screen w/ RandR12 enabled
Date: Sat,  8 Mar 2008 03:07:12 -0800 (PST)
Message-ID: <20080308110713.9FACC13016C@annarchy.freedesktop.org>
References: <bug-14856-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14856-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14856





--- Comment #5 from Luca Ottaviano <lucaotta-whZMOeQn8C0@public.gmane.org>  2008-03-08 03:07:09 PST ---
Ok, now it works with only laptop panel attached. It's a bit slow with redraw
operations, but I'm on xserver 1.3 (and not able to update for a bit).

If I attach a crt monitor before starting X, I get only the external monitor
working, the lvds is on and white, with coloured stripes.
I've updated my Xorg.conf to have a virtual size of 2048x768 and tried to put
the lvds on the right of my crt but with no luck (lvds stays white but windows
move over the right of the crt).
Note that I have only one Monitor section, but as far as I know that should not
matter.

BTW, VT switch is broken (I just see the white screen on my laptop).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
