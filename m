From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] New: HDMI is connected and has mode,
	TV says "no signal"
Date: Mon, 11 Feb 2013 18:20:18 +0000
Message-ID: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0687724008=="
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


--===============0687724008==
Content-Type: multipart/alternative; boundary="1360606819.75bb27da1.31722"; charset="us-ascii"


--1360606819.75bb27da1.31722
Date: Mon, 11 Feb 2013 18:20:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

          Priority: medium
            Bug ID: 60680
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: HDMI is connected and has mode, TV says "no signal"
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 74633
  --> https://bugs.freedesktop.org/attachment.cgi?id=74633&action=edit
kernel log with nouveau.debug=trace, v3.8-rc5-51-g4f84a11

TV does not receive signal when connected via HDMI to my Asus G50V laptop.
Laptop is single-GPU, NV96. xrandr shows HDMI as connected, having a mode, and
it should just work but doesn't. TV does not detect a signal.

LVDS works just fine.

I have tried:
- switching HDMI on and off via xrandr
- setting different video modes with xrandr for the HDMI
- booting with and without HDMI cable connected
- hotplugging HDMI

DDX 1.0.6.
Kernel is the nouveau kernel based on 3.8.0-rc5, v3.8-rc5-51-g4f84a11
commit 4f84a118d8872f21e1d5b78241e0e6f31b79e46b
Author: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Tue Feb 5 20:44:19 2013 +0100

    drm/nouveau/therm: reduce stack usage of nouveau_therm_ic_ctor


The nvidia proprietary drivers can run the TV via HDMI fine.

This is the first time I am trying to run nouveau with HDMI on this machine.

In the kernel log at timestamp 93, I was in X and ran:
$ xrandr --output LVDS-1 --auto --output HDMI-1 --auto --right-of LVDS-1
Before that X had seemed to set up a clone mode at the laptop panels resolution
also on TV.


Similar bugs:
#37085 - I do not know if my case is a regression, different chips.
#43939 - I am using a real TV, not a DVI monitor.
#56601 - I have not even attempted audio yet, video only.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360606819.75bb27da1.31722
Date: Mon, 11 Feb 2013 18:20:19 +0000
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
   title="NEW --- - HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">60680</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HDMI is connected and has mode, TV says &quot;no signal&quot;
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
          <td>ppaalanen&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=74633" name="attach_74633" title="kernel log with nouveau.debug=trace, v3.8-rc5-51-g4f84a11">attachment 74633</a> <a href="attachment.cgi?id=74633&amp;action=edit" title="kernel log with nouveau.debug=trace, v3.8-rc5-51-g4f84a11">[details]</a></span>
kernel log with nouveau.debug=trace, v3.8-rc5-51-g4f84a11

TV does not receive signal when connected via HDMI to my Asus G50V laptop.
Laptop is single-GPU, NV96. xrandr shows HDMI as connected, having a mode, and
it should just work but doesn't. TV does not detect a signal.

LVDS works just fine.

I have tried:
- switching HDMI on and off via xrandr
- setting different video modes with xrandr for the HDMI
- booting with and without HDMI cable connected
- hotplugging HDMI

DDX 1.0.6.
Kernel is the nouveau kernel based on 3.8.0-rc5, v3.8-rc5-51-g4f84a11
commit 4f84a118d8872f21e1d5b78241e0e6f31b79e46b
Author: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
Date:   Tue Feb 5 20:44:19 2013 +0100

    drm/nouveau/therm: reduce stack usage of nouveau_therm_ic_ctor


The nvidia proprietary drivers can run the TV via HDMI fine.

This is the first time I am trying to run nouveau with HDMI on this machine.

In the kernel log at timestamp 93, I was in X and ran:
$ xrandr --output LVDS-1 --auto --output HDMI-1 --auto --right-of LVDS-1
Before that X had seemed to set up a clone mode at the laptop panels resolution
also on TV.


Similar bugs:
#37085 - I do not know if my case is a regression, different chips.
#43939 - I am using a real TV, not a DVI monitor.
#56601 - I have not even attempted audio yet, video only.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360606819.75bb27da1.31722--

--===============0687724008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0687724008==--
