From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74815] New: nouveau: no displayport output on quadro
 400/600 cards
Date: Mon, 10 Feb 2014 23:48:00 +0000
Message-ID: <bug-74815-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1564575478=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1564575478==
Content-Type: multipart/alternative; boundary="1392076080.7a7061.30848"; charset="us-ascii"


--1392076080.7a7061.30848
Date: Mon, 10 Feb 2014 23:48:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74815

          Priority: medium
            Bug ID: 74815
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau: no displayport output on quadro 400/600 cards
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mgulick-I5WecO5yM8GakBO8gow8eQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 93816
  --> https://bugs.freedesktop.org/attachment.cgi?id=93816&action=edit
boot log from 3.14-rc2 with nouveau.debug=PDISP=debug,VBIOS=trace

Using dual monitors, one on DVI and one on Displayport, the displayport output
is blank.  The monitor will not come out of sleep mode.  xrandr reports both
displays and indicates both displays are active.  Have tried disabling/enabling
outputs, and changing orientation.

Tested against kernels:
3.8.13 - works ok on both outputs
3.9.11 - no DP output
3.10.26 - no DP output
3.14-rc2 - no DP output

Tested against following cards:
Quadro 400 (GT216GL) - no DP output
Quadro 600 (GF108FL) - no DP output
Quadro K600 (GK107) - both outputs fine

OS is stock Debian Wheezy 7.2 with updated kernel.

Attached boot log from 3.14-rc2 with 'nouveau.debug=PDISP=debug,VBIOS=trace'

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392076080.7a7061.30848
Date: Mon, 10 Feb 2014 23:48:00 +0000
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
   title="NEW --- - nouveau: no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815">74815</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau: no displayport output on quadro 400/600 cards
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
          <td>mgulick&#64;mathworks.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=93816" name="attach_93816" title="boot log from 3.14-rc2 with nouveau.debug=PDISP=debug,VBIOS=trace">attachment 93816</a> <a href="attachment.cgi?id=93816&amp;action=edit" title="boot log from 3.14-rc2 with nouveau.debug=PDISP=debug,VBIOS=trace">[details]</a></span>
boot log from 3.14-rc2 with nouveau.debug=PDISP=debug,VBIOS=trace

Using dual monitors, one on DVI and one on Displayport, the displayport output
is blank.  The monitor will not come out of sleep mode.  xrandr reports both
displays and indicates both displays are active.  Have tried disabling/enabling
outputs, and changing orientation.

Tested against kernels:
3.8.13 - works ok on both outputs
3.9.11 - no DP output
3.10.26 - no DP output
3.14-rc2 - no DP output

Tested against following cards:
Quadro 400 (GT216GL) - no DP output
Quadro 600 (GF108FL) - no DP output
Quadro K600 (GK107) - both outputs fine

OS is stock Debian Wheezy 7.2 with updated kernel.

Attached boot log from 3.14-rc2 with 'nouveau.debug=PDISP=debug,VBIOS=trace'</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392076080.7a7061.30848--

--===============1564575478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1564575478==--
