From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80980] New: Suspend is broken on NV11
Date: Sun, 06 Jul 2014 19:38:56 +0000
Message-ID: <bug-80980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0643940347=="
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


--===============0643940347==
Content-Type: multipart/alternative; boundary="1404675536.FeD7bDA1.7389"; charset="us-ascii"


--1404675536.FeD7bDA1.7389
Date: Sun, 6 Jul 2014 19:38:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80980

          Priority: medium
            Bug ID: 80980
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Suspend is broken on NV11
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: a.p.huntley-FhtRXb7CoQBt1OO0OYaSVA@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Suspend with GeForce2 Go is successful, but leaves the display on and
completely white (backlight on).
On resume, display is corrupted: tty output is jumbled and xorg output is
wierd. However, xorg still responds; you can move the mouse, windows etc and
the system shuts down cleanly using the power button.
Booting with nouveau.agpmode=0 and nouveau.vram_pushbuf=1 have no visible
effect.

journalctl output: http://pastebin.com/729PKGnq
linux: 3.15.3
xorg-server: 1.15.2
xf86-video-nouveau: 1.0.10

For the ~2 years I have been using linux on this laptop, suspend has never
worked, whether on nouveau or nvidia.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404675536.FeD7bDA1.7389
Date: Sun, 6 Jul 2014 19:38:56 +0000
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
   title="NEW --- - Suspend is broken on NV11"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80980">80980</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Suspend is broken on NV11
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
          <td>a.p.huntley&#64;btinternet.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Suspend with GeForce2 Go is successful, but leaves the display on and
completely white (backlight on).
On resume, display is corrupted: tty output is jumbled and xorg output is
wierd. However, xorg still responds; you can move the mouse, windows etc and
the system shuts down cleanly using the power button.
Booting with nouveau.agpmode=0 and nouveau.vram_pushbuf=1 have no visible
effect.

journalctl output: <a href="http://pastebin.com/729PKGnq">http://pastebin.com/729PKGnq</a>
linux: 3.15.3
xorg-server: 1.15.2
xf86-video-nouveau: 1.0.10

For the ~2 years I have been using linux on this laptop, suspend has never
worked, whether on nouveau or nvidia.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404675536.FeD7bDA1.7389--

--===============0643940347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0643940347==--
