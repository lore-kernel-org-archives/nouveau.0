From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85465] New: X loses resources after suspend/resume
Date: Sun, 26 Oct 2014 01:33:07 +0000
Message-ID: <bug-85465-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1724661729=="
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


--===============1724661729==
Content-Type: multipart/alternative; boundary="1414287187.8Caf2E71.8527"; charset="UTF-8"


--1414287187.8Caf2E71.8527
Date: Sun, 26 Oct 2014 01:33:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85465

            Bug ID: 85465
           Summary: X loses resources after suspend/resume
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: barkalow-o/mKjEDNO/Bg9hUCZPvPmw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

After suspending to ram and resuming, many things appear blank, and dmesg has
errors. In particular: icons for iconified windows, all non-core text (xterm
with misc-fixed still works, but web browsers have nothing), images in web
pages, the contents of windows (until they get redrawn). Restarting the X
server fixes it.

hardware: NVIDIA Corporation GF116M [GeForce GT 560M] (rev a1)

versions:
 xorg: 1.15.0
 nouveau: compiled for 1.15.0, module version = 1.0.10
 libdrm: 2.4.52
 mesa: 10.0.4
 kernel: 3.14.19

I can try newer versions of particular things if it would be helpful, although
I don't know which component would be relevant and I haven't seen any similar
reports. I can also apply patches for more debugging info.

The errors are a lot of lines like:

[24060.452246] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 2 [0x005fba0000
X[2287]]
[24060.452254] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414287187.8Caf2E71.8527
Date: Sun, 26 Oct 2014 01:33:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - X loses resources after suspend/resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85465">85465</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X loses resources after suspend/resume
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>barkalow&#64;iabervon.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>After suspending to ram and resuming, many things appear blank, and dmesg has
errors. In particular: icons for iconified windows, all non-core text (xterm
with misc-fixed still works, but web browsers have nothing), images in web
pages, the contents of windows (until they get redrawn). Restarting the X
server fixes it.

hardware: NVIDIA Corporation GF116M [GeForce GT 560M] (rev a1)

versions:
 xorg: 1.15.0
 nouveau: compiled for 1.15.0, module version = 1.0.10
 libdrm: 2.4.52
 mesa: 10.0.4
 kernel: 3.14.19

I can try newer versions of particular things if it would be helpful, although
I don't know which component would be relevant and I haven't seen any similar
reports. I can also apply patches for more debugging info.

The errors are a lot of lines like:

[24060.452246] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 2 [0x005fba0000
X[2287]]
[24060.452254] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414287187.8Caf2E71.8527--

--===============1724661729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1724661729==--
