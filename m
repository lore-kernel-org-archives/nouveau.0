From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21869] Chroma mismatch using XV
Date: Sun, 25 Oct 2009 12:43:29 -0700 (PDT)
Message-ID: <20091025194330.03E121300D9@annarchy.freedesktop.org>
References: <bug-21869-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21869-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21869





--- Comment #21 from Ancoron <ancoron-gfoo8dC7XAXddJNmlsFzeA@public.gmane.org>  2009-10-25 12:43:28 PST ---
(In reply to comment #19)
> Since video overlays are not supported with KMS, I doubt there is any point in
> trying to fix this. Other types of Xv adaptors do not exhibit this bug, do
> they?
> 

OK, but as long as I understand KMS it just provides textured video which uses
the 3D engine whereas XV uses separate resources and therefore wouldn't
interfere calculations in the 3D pipeline or OpenCL as much as textured video
does.

Am I completely wrong at this point?

Additionally I see a lot of attributes for the overlay adapter:
      "XV_DOUBLE_BUFFER" (range 0 to 1)
      "XV_COLORKEY" (range 0 to 16777215)
      "XV_AUTOPAINT_COLORKEY" (range 0 to 1)
      "XV_SET_DEFAULTS" (range 0 to 0)
      "XV_BRIGHTNESS" (range -512 to 511)
      "XV_CONTRAST" (range 0 to 8191)
      "XV_SATURATION" (range 0 to 8191)
      "XV_HUE" (range 0 to 360)
      "XV_ITURBT_709" (range 0 to 1)
      "XV_ON_CRTC_NB" (range 0 to 1)

In contrast all other adapters just have these:
      "XV_SET_DEFAULTS" (range 0 to 0)
      "XV_SYNC_TO_VBLANK" (range 0 to 1)

That leads me to the conclusion that XV does provide much more utilizing the
graphics hardware whereas the others provide less and therefore video players
will do other tasks on the CPU regardless of the fact that the hardware might
be better for that (although this may not be the case for nVidia cards).

As I see how fast the XV implementation is (except this chroma issue) on my
rather limited system (Pentium M 1.4GHz, NV34M 64MB) and I fear that if I
upgrade to Ubuntu Karmic later this month I will see much more of my CPU being
used for just video playback whereas it is open most open for other tasks until
now.

So can I be sure that KMS and its related stuff will use my available hardware
at least as good as nouveau does it until now by itself?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
