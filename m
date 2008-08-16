From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16952] Bad video modes
Date: Sat, 16 Aug 2008 08:44:20 -0700 (PDT)
Message-ID: <20080816154420.A41222DC241@annarchy.freedesktop.org>
References: <bug-16952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16952


Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|nouveau-PD4FTy7X32lNgt0PjOBp9/EVdHwE84te@public.gmane.org|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                   |g                           |
          Component|Driver/nouveau              |Server/general




--- Comment #1 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2008-08-16 08:44:19 PST ---
After discussion with malc0 and stillunknown, I'm reassigning this to
xorg-server.

EDID reported monitor freq ranges: V min: 50 V max: 85 Hz, H min: 30 H max: 82
kHz, PixClock max 140 MHz. There are several doublescan modes that actually fit
into the freq ranges, especially 800x600@65D. Xrandr reports doublescan modes
by showing the refresh rate as double, which can be seen in the xrandr output
in the previous comment. As higher refresh rates are automatically favoured,
this means doublescan modes get priority. E.g. 800x600@65D is in randr1.2 speak
800x600@130, which is then preferred over all normal 800x600 modes. As the
monitor cannot deal with doublescan modes, I don't get a picture by default.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
