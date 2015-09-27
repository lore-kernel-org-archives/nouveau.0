From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92136] New: WebGL Conformance
 conformance/textures/texture-size-limit.html -> system freeze
Date: Sun, 27 Sep 2015 06:54:13 +0000
Message-ID: <bug-92136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1197200208=="
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


--===============1197200208==
Content-Type: multipart/alternative; boundary="1443336853.Ac1bb0.26823"; charset="UTF-8"


--1443336853.Ac1bb0.26823
Date: Sun, 27 Sep 2015 06:54:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92136

            Bug ID: 92136
           Summary: WebGL Conformance
                    conformance/textures/texture-size-limit.html -> system
                    freeze
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lukebenes-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

In Google Chrome, navigate to:

https://www.khronos.org/registry/webgl/conformance-suites/1.0.2/conformance/textures/texture-size-limit.html

On my on my GTX 650, this causes the desktop to lock-up with the Nouveau
drivers, but passes with the Nvidia proprietary driver. 

dmesg failure output:
[ 4183.336016] nouveau W[     DRM] skipped size 80010000
...
[ 4183.589907] nouveau W[     DRM] skipped size 80010000
[ 4183.740567] nouveau E[   PFIFO][0000:03:00.0] write fault at 0x002cfcb000
[PDE] from CE2/GR_CE on channel 0x007f61d000 [unknown]

Tested on Ubuntu 14.04 with default mesa and Ubuntu 15.10 with edgers(Mesa
11.0)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443336853.Ac1bb0.26823
Date: Sun, 27 Sep 2015 06:54:13 +0000
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
   title="NEW - WebGL Conformance conformance/textures/texture-size-limit.html -&gt; system freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92136">92136</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>WebGL Conformance conformance/textures/texture-size-limit.html -&gt; system freeze
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>lukebenes&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>In Google Chrome, navigate to:

<a href="https://www.khronos.org/registry/webgl/conformance-suites/1.0.2/conformance/textures/texture-size-limit.html">https://www.khronos.org/registry/webgl/conformance-suites/1.0.2/conformance/textures/texture-size-limit.html</a>

On my on my GTX 650, this causes the desktop to lock-up with the Nouveau
drivers, but passes with the Nvidia proprietary driver. 

dmesg failure output:
[ 4183.336016] nouveau W[     DRM] skipped size 80010000
...
[ 4183.589907] nouveau W[     DRM] skipped size 80010000
[ 4183.740567] nouveau E[   PFIFO][0000:03:00.0] write fault at 0x002cfcb000
[PDE] from CE2/GR_CE on channel 0x007f61d000 [unknown]

Tested on Ubuntu 14.04 with default mesa and Ubuntu 15.10 with edgers(Mesa
11.0)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443336853.Ac1bb0.26823--

--===============1197200208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1197200208==--
