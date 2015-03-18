From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89620] New: Nouveau driver for Nvidia card GeForce
	GT 550M]
Date: Wed, 18 Mar 2015 01:19:41 +0000
Message-ID: <bug-89620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1110715100=="
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


--===============1110715100==
Content-Type: multipart/alternative; boundary="1426641581.edeBeC81.30795"; charset="UTF-8"


--1426641581.edeBeC81.30795
Date: Wed, 18 Mar 2015 01:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89620

            Bug ID: 89620
           Summary: Nouveau driver for Nvidia card GeForce GT 550M]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: high
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: grgoffe-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I presume that the nouveau driver is responsible for drawing the mouse pointer.
My pointer seems to be redrawn constantly producing what Windows used to call
"Tails". Multiple images of the mouse pointer. Additionally, there seems to be
some wild pointer because data from somewhere else in memory sometimes appears
with the mouse pointer.

There appears to be no messages related to this behavior in the dmesg buffer.

Occasionally I get a segfault. I have Xorg.0.log files and their corresponding
dmesg buffer files available if needed.

This is a Fedora 21 x86_64 system with a kernel at 3.18.8-201.fc21.x86_64

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426641581.edeBeC81.30795
Date: Wed, 18 Mar 2015 01:19:41 +0000
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
   title="NEW - Nouveau driver for Nvidia card GeForce GT 550M]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89620">89620</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau driver for Nvidia card GeForce GT 550M]
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
          <td>high
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
          <td>grgoffe&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I presume that the nouveau driver is responsible for drawing the mouse pointer.
My pointer seems to be redrawn constantly producing what Windows used to call
&quot;Tails&quot;. Multiple images of the mouse pointer. Additionally, there seems to be
some wild pointer because data from somewhere else in memory sometimes appears
with the mouse pointer.

There appears to be no messages related to this behavior in the dmesg buffer.

Occasionally I get a segfault. I have Xorg.0.log files and their corresponding
dmesg buffer files available if needed.

This is a Fedora 21 x86_64 system with a kernel at 3.18.8-201.fc21.x86_64</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426641581.edeBeC81.30795--

--===============1110715100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1110715100==--
