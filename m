From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77729] New: Screen freeze then X crash
Date: Mon, 21 Apr 2014 12:50:40 +0000
Message-ID: <bug-77729-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0650866777=="
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


--===============0650866777==
Content-Type: multipart/alternative; boundary="1398084640.8eF57C1.18348"; charset="us-ascii"


--1398084640.8eF57C1.18348
Date: Mon, 21 Apr 2014 12:50:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77729

          Priority: medium
            Bug ID: 77729
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Screen freeze then X crash
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: soundx94-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 97690
  --> https://bugs.freedesktop.org/attachment.cgi?id=97690&action=edit
Xorg.0.log

Hi!

I'm using archlinux x86_64 with latest mesa,nouveau from the official repos and
nouveau-fw from the aur. (Hw: NVE6: GTX 660)
I get random screen freezes every 10 min - 1 hour in a gnome session.
Once the screen freezes the mouse and sometimes the keyboard goes unresponsive
too  .(even the leds for num lock do not respond)
I can switch to another tty (I get nouveau messages here: "cannot idle
channel..."), kill the running gnome session, switch back then restart the
gnome session but the restarted gnome session gets back to the very last image
before the freeze and it is unresponsive. After 10-30 secs that restarted
session crashes and I cannot get X working again without a complete restart.

X log attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398084640.8eF57C1.18348
Date: Mon, 21 Apr 2014 12:50:40 +0000
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
   title="NEW --- - Screen freeze then X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77729">77729</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen freeze then X crash
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
          <td>soundx94&#64;hotmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=97690" name="attach_97690" title="Xorg.0.log">attachment 97690</a> <a href="attachment.cgi?id=97690&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

Hi!

I'm using archlinux x86_64 with latest mesa,nouveau from the official repos and
nouveau-fw from the aur. (Hw: NVE6: GTX 660)
I get random screen freezes every 10 min - 1 hour in a gnome session.
Once the screen freezes the mouse and sometimes the keyboard goes unresponsive
too  .(even the leds for num lock do not respond)
I can switch to another tty (I get nouveau messages here: &quot;cannot idle
channel...&quot;), kill the running gnome session, switch back then restart the
gnome session but the restarted gnome session gets back to the very last image
before the freeze and it is unresponsive. After 10-30 secs that restarted
session crashes and I cannot get X working again without a complete restart.

X log attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398084640.8eF57C1.18348--

--===============0650866777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0650866777==--
