From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24596] New: Video adapter #0 is jittery,
 while adapter #2 isn't.
Date: Sat, 17 Oct 2009 18:14:12 -0700 (PDT)
Message-ID: <bug-24596-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24596

           Summary: Video adapter #0 is jittery, while adapter #2 isn't.
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tdfischer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have a GeForce6200 in my box, which xvinfo reports as having three video
adapters:

  Adaptor #0: "NV40 texture adapter"
  Adaptor #1: "NV40 high quality adapter"
  Adaptor #2: "NV Video Blitter"

By default, mplayer and every other video player I know of tries to use Adapter
0. Unless I explicitly tell the player to use the Video Blitter adapter, my
movie is very jumpy and jittery in full screen, where 'full screen' is
2048x1152. If I play my movie at the default size of 'small', there isn't any
noticeable lag. Here I define 'jumpy' and 'jittery' to mean: every other second
or so the video backs up a frame and then goes forward to where it should be.

I think that the best adapter for watching video should be the default one,
yes? Typing 'mplayer dvd://' should Just Work. Even if there are plans to
improve the other adapters to play a DVD without jumpiness, I suggest making
the best working adapter the default until then.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
