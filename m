From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83550] New: [NVA5] Monitor not restored after resume
 [regression]
Date: Sat, 06 Sep 2014 02:07:33 +0000
Message-ID: <bug-83550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0692941839=="
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


--===============0692941839==
Content-Type: multipart/alternative; boundary="1409969253.5B6Dc4831.19488"; charset="us-ascii"


--1409969253.5B6Dc4831.19488
Date: Sat, 6 Sep 2014 02:07:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83550

          Priority: medium
            Bug ID: 83550
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVA5] Monitor not restored after resume [regression]
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: anka.213.bacn+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 105823
  --> https://bugs.freedesktop.org/attachment.cgi?id=105823&action=edit
vbios.rom

I have a GT216 [GeForce 210] (rev a2). I have two monitors, one connected with
DVI, the other with VGA. In revisions after 415f12efc1b only the one connected
to VGA will restore after suspend.

I need to apply
[ba5e01b0d0146c2d2bb5475cf1d6efec51bf2669] drm/nv50/disp: fix a potential oops
in supervisor handling
to make it restore at all in 415f12efc1b..ba5e01b0d^. Otherwise the computer
completely fails to resume. (The computer wakes up but is completely
unresponsive. Both monitors are off. Pressing the keyboard makes the num-lock
key blink once and nothing more. This is the same behaviour it has when the
computer is suspended. The only difference is that the power light is not
blinking.)

xrandr seems to think that the screen was restored properly.


> lspci
01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce 210] (rev
a2)

> git bisect log
# first bad commit: [415f12efc1b2308411b2cbc3e82666b3db8a7758] drm/nv50/disp:
start removing direct vbios parsing from supervisor

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409969253.5B6Dc4831.19488
Date: Sat, 6 Sep 2014 02:07:33 +0000
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
   title="NEW --- - [NVA5] Monitor not restored after resume [regression]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83550">83550</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA5] Monitor not restored after resume [regression]
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
          <td>anka.213.bacn+freedesktop&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=105823" name="attach_105823" title="vbios.rom">attachment 105823</a> <a href="attachment.cgi?id=105823&amp;action=edit" title="vbios.rom">[details]</a></span>
vbios.rom

I have a GT216 [GeForce 210] (rev a2). I have two monitors, one connected with
DVI, the other with VGA. In revisions after 415f12efc1b only the one connected
to VGA will restore after suspend.

I need to apply
[ba5e01b0d0146c2d2bb5475cf1d6efec51bf2669] drm/nv50/disp: fix a potential oops
in supervisor handling
to make it restore at all in 415f12efc1b..ba5e01b0d^. Otherwise the computer
completely fails to resume. (The computer wakes up but is completely
unresponsive. Both monitors are off. Pressing the keyboard makes the num-lock
key blink once and nothing more. This is the same behaviour it has when the
computer is suspended. The only difference is that the power light is not
blinking.)

xrandr seems to think that the screen was restored properly.


<span class="quote">&gt; lspci</span >
01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce 210] (rev
a2)

<span class="quote">&gt; git bisect log</span >
# first bad commit: [415f12efc1b2308411b2cbc3e82666b3db8a7758] drm/nv50/disp:
start removing direct vbios parsing from supervisor</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409969253.5B6Dc4831.19488--

--===============0692941839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0692941839==--
