From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21869] New: Chroma mismatch using XV
Date: Fri, 22 May 2009 04:54:20 -0700 (PDT)
Message-ID: <bug-21869-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21869

           Summary: Chroma mismatch using XV
           Product: xorg
           Version: 7.4
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ancoron-gfoo8dC7XAXddJNmlsFzeA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I recently found out that the nouveau driver (and especially its XV
implementation) causes the following chroma-issue with my NV34M. At every
second frame I can see that the chroma is reused from the last frame and not
updated for the current frame. The luminance is always correct.

I checked on another machine with a radeon card to verify that it is not a
problem caused by some other things. XV rendering itself is very fast and I
don't have other problems here.

I have extracted an interesting portion of an encoded video to show what I
mean. I would really like to be able to provide a screenshot of a frame but I
don't know how to get those rendered frames out of the video memory.

If anyone comes by this issue with another hardware than mine please check if
you get the same issue there.

The command I used to verify the problem in mplayer was:

mplayer xv-chroma-mismatch.avi -fps 1 -vo x11

In addition mplayer output is just fine.

Machine infos:

Dell Inspiron 8600
- nVidia GeForce FX Go5200 64M (rev a1, NV34M)
- Kubuntu Jaunty (9.04)

$ dpkg -l | grep nouveau
ii  libdrm-nouveau1                 2.4.7-0~8.10~ppa3
ii  nouveau-kernel-source           0.0.11+git20090404-0ubuntu1
ii  xserver-xorg-video-nouveau      1:0.0.10~git+20090404+11be9a9-0ubuntu1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
