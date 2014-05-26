From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] New: (two) GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 16:00:42 +0000
Message-ID: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0162921407=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0162921407==
Content-Type: multipart/alternative; boundary="1401120042.A2a14d081.825"; charset="us-ascii"


--1401120042.A2a14d081.825
Date: Mon, 26 May 2014 16:00:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

          Priority: medium
            Bug ID: 79266
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: (two) GT 430 / GF108 sluggish, unstable performance
                    and blue tint with vdpau
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: afasdfsdfaa-NltIWcMOmWn1P9xLtpHBDw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 99879
  --> https://bugs.freedesktop.org/attachment.cgi?id=99879&action=edit
dmesg

1. All the problems exist in exactly the same form since I had this PC, that is
3 years now - and it runs well (mostly) with the proprietary driver (so I
didn't bother)
2. None of the common fixes and workarounds (without recompiling) work and they
don't seem to target the problem at all
3. Affects all sorts of versions since 3 years, seems to be an issue with the
particular cards rather

For vdpau, the issue looks almost identical to:

https://bbs.archlinux.org/viewtopic.php?id=137877&p=1 (If you watch the Avatar
movie trailer on youtube, people are blue Na'vi have skin color)

... except that nothing of the suggested options works, that is without turning
vdpau off. If vdpau is used, flash plugin might crash often and randomly.
Mplayer exhibits arbitrary behavior, such that the video only plays and plays
as fast as you wiggle/move the mouse. The white OSD in mplayer is black. 

If X is killed, the computer sometimes freezes entirely. Sometimes arbitrary
crashes, even if vdpau was never used since X was started. Suspend to memory
won't wake up. 3 years ago I removed vdpau entirely and still applications
would crash more frequently and the system was more unstable.

If compared 1:1 to the nvidia driver, it becomes immediately obvious that the
performance is slower, applications open slower by 100-500ms (sometimes
seconds), you can literally see little squares updating the screen bit by bit
if xorg windows are closed/switched instantly. Conversely, CPU consumption is
low all the time and rest of the PC is decent enough (like 32GB RAM and what
not). 

I tried all the combinations of the documented (under "man nouveau") xorg
options, including vblank sync, multihead or single screen or no xorg.conf and
whatever you can but the tearing during video playback is just enormous with
the nouveau driver (It was already annoying with the nvidia driver though but
with nouveau it is *massive*). CPU load is still 5% or something...

I just tried wine and it did not run either, although glxgears did. Not sure
why that is.

It is some issue with this particular card, possibly related to the motherboard
or some hardware constellation, but I guess it is just the card. Nothing of the
sorts exists with the proprietary driver (suspend works, colors ok, vdpau ok,
GL ok, etc. though there also is some tearing in videos).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401120042.A2a14d081.825
Date: Mon, 26 May 2014 16:00:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - (two) GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">79266</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>(two) GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>afasdfsdfaa&#64;master.ms
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=99879" name="attach_99879" title="dmesg">attachment 99879</a> <a href="attachment.cgi?id=99879&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

1. All the problems exist in exactly the same form since I had this PC, that is
3 years now - and it runs well (mostly) with the proprietary driver (so I
didn't bother)
2. None of the common fixes and workarounds (without recompiling) work and they
don't seem to target the problem at all
3. Affects all sorts of versions since 3 years, seems to be an issue with the
particular cards rather

For vdpau, the issue looks almost identical to:

<a href="https://bbs.archlinux.org/viewtopic.php?id=137877&amp;p=1">https://bbs.archlinux.org/viewtopic.php?id=137877&amp;p=1</a> (If you watch the Avatar
movie trailer on youtube, people are blue Na'vi have skin color)

... except that nothing of the suggested options works, that is without turning
vdpau off. If vdpau is used, flash plugin might crash often and randomly.
Mplayer exhibits arbitrary behavior, such that the video only plays and plays
as fast as you wiggle/move the mouse. The white OSD in mplayer is black. 

If X is killed, the computer sometimes freezes entirely. Sometimes arbitrary
crashes, even if vdpau was never used since X was started. Suspend to memory
won't wake up. 3 years ago I removed vdpau entirely and still applications
would crash more frequently and the system was more unstable.

If compared 1:1 to the nvidia driver, it becomes immediately obvious that the
performance is slower, applications open slower by 100-500ms (sometimes
seconds), you can literally see little squares updating the screen bit by bit
if xorg windows are closed/switched instantly. Conversely, CPU consumption is
low all the time and rest of the PC is decent enough (like 32GB RAM and what
not). 

I tried all the combinations of the documented (under &quot;man nouveau&quot;) xorg
options, including vblank sync, multihead or single screen or no xorg.conf and
whatever you can but the tearing during video playback is just enormous with
the nouveau driver (It was already annoying with the nvidia driver though but
with nouveau it is *massive*). CPU load is still 5% or something...

I just tried wine and it did not run either, although glxgears did. Not sure
why that is.

It is some issue with this particular card, possibly related to the motherboard
or some hardware constellation, but I guess it is just the card. Nothing of the
sorts exists with the proprietary driver (suspend works, colors ok, vdpau ok,
GL ok, etc. though there also is some tearing in videos).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401120042.A2a14d081.825--

--===============0162921407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0162921407==--
