From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58735] New: GeForce 680,
 HDMI output no good after passing through HDMI-to-DVI converter
Date: Tue, 25 Dec 2012 06:43:34 +0000
Message-ID: <bug-58735-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1826404284=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1826404284==
Content-Type: multipart/alternative; boundary="1356417815.eEec1E1.15885"; charset="us-ascii"


--1356417815.eEec1E1.15885
Date: Tue, 25 Dec 2012 06:43:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58735

          Priority: medium
            Bug ID: 58735
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GeForce 680, HDMI output no good after passing through
                    HDMI-to-DVI converter
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: quantheory-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 72095
  --> https://bugs.freedesktop.org/attachment.cgi?id=72095&action=edit
xrandr output

I think this is an interesting one.

I run Gentoo with the hardened patches. Noticing that the git version of
nouveau had finally turned on acceleration for my card by default, I got kernel
3.7 (Gentoo hardened), and manually used a git patch to pull in the most recent
version yesterday (commit 73e5cf2d9af6bb32b91f8a2f6d7c44c8e9b4e785, as of now
still HEAD).

To my delight (and, I'll admit, mild surprise), everything seemed to work fine
right away, at least as far as 2D acceleration and basic desktop stuff went. I
had two monitors plugged in, both with DVI cards, all very well and good.

I tried plugging in a third monitor today, using an HDMI cable with a
HDMI-to-DVI converter at the end (the monitor has no HDMI input), and I got a
floating blue message across the monitor saying "Input Not Supported".
Obviously a monitor message, not from the computer, which shows that the
monitor recognizes that it's getting something, but doesn't understand what.
The monitor's auto-detect does recognize when I plug the thing in.

xrandr shows the monitor, as well as some graphical equivalents (e.g. the GNOME
3 "Displays" screen). This output is also perfectly correct and equivalent to
the other identical monitors. I can drag windows to (and off of) that part of
the screen, and in all respects the computer seems to be blissfully unaware of
the monitor not working.

I can attach a kernel log, but I think it would be much better if I reboot in a
kernel without USB_DEBUG on, first. The spam makes it enormous, and I only had
it on to troubleshoot a different device that now works.

Oh, also:

- This setup works with the proprietary nVidia driver.

- This setup works with Windows 7 and nVidia's driver.

- I have no devices at hand to test if the HDMI video output works without the
DVI converter, so my belief that this is an issue with that conversion is just
a hunch.

- It might be that this is just an issue with the early/primitive support for a
relatively new card, but there are older, similar bugs, maybe duplicates:

Bug 17187
Bug 43939

- Also, a bug with HDMI that was never resolved (it seems):

Bug 56601


I'm going to hack around looking at this myself some more, but any input on
things to look at would be appreciated.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356417815.eEec1E1.15885
Date: Tue, 25 Dec 2012 06:43:35 +0000
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
   title="NEW --- - GeForce 680, HDMI output no good after passing through HDMI-to-DVI converter"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58735">58735</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GeForce 680, HDMI output no good after passing through HDMI-to-DVI converter
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>quantheory&#64;gmail.com
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=72095" name="attach_72095" title="xrandr output">attachment 72095</a> <a href="attachment.cgi?id=72095&amp;action=edit" title="xrandr output">[details]</a></span>
xrandr output

I think this is an interesting one.

I run Gentoo with the hardened patches. Noticing that the git version of
nouveau had finally turned on acceleration for my card by default, I got kernel
3.7 (Gentoo hardened), and manually used a git patch to pull in the most recent
version yesterday (commit 73e5cf2d9af6bb32b91f8a2f6d7c44c8e9b4e785, as of now
still HEAD).

To my delight (and, I'll admit, mild surprise), everything seemed to work fine
right away, at least as far as 2D acceleration and basic desktop stuff went. I
had two monitors plugged in, both with DVI cards, all very well and good.

I tried plugging in a third monitor today, using an HDMI cable with a
HDMI-to-DVI converter at the end (the monitor has no HDMI input), and I got a
floating blue message across the monitor saying &quot;Input Not Supported&quot;.
Obviously a monitor message, not from the computer, which shows that the
monitor recognizes that it's getting something, but doesn't understand what.
The monitor's auto-detect does recognize when I plug the thing in.

xrandr shows the monitor, as well as some graphical equivalents (e.g. the GNOME
3 &quot;Displays&quot; screen). This output is also perfectly correct and equivalent to
the other identical monitors. I can drag windows to (and off of) that part of
the screen, and in all respects the computer seems to be blissfully unaware of
the monitor not working.

I can attach a kernel log, but I think it would be much better if I reboot in a
kernel without USB_DEBUG on, first. The spam makes it enormous, and I only had
it on to troubleshoot a different device that now works.

Oh, also:

- This setup works with the proprietary nVidia driver.

- This setup works with Windows 7 and nVidia's driver.

- I have no devices at hand to test if the HDMI video output works without the
DVI converter, so my belief that this is an issue with that conversion is just
a hunch.

- It might be that this is just an issue with the early/primitive support for a
relatively new card, but there are older, similar bugs, maybe duplicates:

<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - Toshiba Satellite A300 keyboard mapping"
   href="show_bug.cgi?id=17187">Bug 17187</a>
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)"
   href="show_bug.cgi?id=43939">Bug 43939</a>

- Also, a bug with HDMI that was never resolved (it seems):

<a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - 9600m GT HDMI output no video or audio."
   href="show_bug.cgi?id=56601">Bug 56601</a>


I'm going to hack around looking at this myself some more, but any input on
things to look at would be appreciated.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356417815.eEec1E1.15885--

--===============1826404284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1826404284==--
