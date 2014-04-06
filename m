From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77106] New: Blank screen and errors on Thinkpad
 T440p GeForce 730M/Intel optimus setup
Date: Sun, 06 Apr 2014 14:18:51 +0000
Message-ID: <bug-77106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1193605561=="
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


--===============1193605561==
Content-Type: multipart/alternative; boundary="1396793931.e5c71.2604"; charset="us-ascii"


--1396793931.e5c71.2604
Date: Sun, 6 Apr 2014 14:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77106

          Priority: medium
            Bug ID: 77106
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Blank screen and errors on Thinkpad T440p GeForce
                    730M/Intel optimus setup
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mkj-1kv+JzgSdXk@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

My setup is Gentoo +:
kernel 3.14, Mesa 10.4.0, xserver 1.15, libdrm 2.4.52, nouveau 1.0.10

Normally my machine works using the Intel HD graphics only, but I wanted to
experiment with nvidia/nouveau drivers.
Using the proprietary Nvidia driver, and kernel 3.13, I managed to make a
xorg.conf file that "disabled" the Intel card and only the Nvidia card
primarily for 2D/3D. 
Using the same xorg.conf, and the 3.14 kernel, I replaced the nvidia driver
with nouveau, and I end up with a blank screen and some weird errors in my
dmesg.

Any ideas?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396793931.e5c71.2604
Date: Sun, 6 Apr 2014 14:18:51 +0000
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
   title="NEW --- - Blank screen and errors on Thinkpad T440p GeForce 730M/Intel optimus setup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77106">77106</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Blank screen and errors on Thinkpad T440p GeForce 730M/Intel optimus setup
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
          <td>mkj&#64;gotu.dk
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
        <pre>My setup is Gentoo +:
kernel 3.14, Mesa 10.4.0, xserver 1.15, libdrm 2.4.52, nouveau 1.0.10

Normally my machine works using the Intel HD graphics only, but I wanted to
experiment with nvidia/nouveau drivers.
Using the proprietary Nvidia driver, and kernel 3.13, I managed to make a
xorg.conf file that &quot;disabled&quot; the Intel card and only the Nvidia card
primarily for 2D/3D. 
Using the same xorg.conf, and the 3.14 kernel, I replaced the nvidia driver
with nouveau, and I end up with a blank screen and some weird errors in my
dmesg.

Any ideas?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396793931.e5c71.2604--

--===============1193605561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1193605561==--
