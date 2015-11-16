From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92968] New: OpenScad has lousy performance
Date: Mon, 16 Nov 2015 10:59:49 +0000
Message-ID: <bug-92968-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1726110179=="
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


--===============1726110179==
Content-Type: multipart/alternative; boundary="1447671588.B0FA4c0.29656"; charset="UTF-8"


--1447671588.B0FA4c0.29656
Date: Mon, 16 Nov 2015 10:59:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92968

            Bug ID: 92968
           Summary: OpenScad has lousy performance
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: r.e.wolff-bu/CaDbLbdHGjfRZg6uqBA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

OpenScad performance is WAY less than what I'm used to. This is with new
hardware and a more recent ubuntu version. 

Suggestion on the mailing list: disable vblank syncing. I was unable to do
this. The environment variable setting that works for glxgears does not
influence the behaviour of openscad. I was unable to achieve disabling the
option in the X server. 

Suggestions on the IRC channel led me to try installing an older version. I
created an chrooted ubuntu 14.04 environment. The openscad in there provides
reasonable performance. 

I then recompiled the current git version of openscad in the chrooted 14.04
environment, and that too provides reasonable performance. 

So: Without changing the X server (or its configuration) it is possible to
achieve good performance. Also, the source of openscad is not the culprit, but
the libraries linked to. 

This does not mean that it is not an openscad bug: It could very well be that
openscad requests a feature that was unimplemented on earlier libraries.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447671588.B0FA4c0.29656
Date: Mon, 16 Nov 2015 10:59:48 +0000
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
   title="NEW - OpenScad has lousy performance"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92968">92968</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>OpenScad has lousy performance
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
          <td>r.e.wolff&#64;bitwizard.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>OpenScad performance is WAY less than what I'm used to. This is with new
hardware and a more recent ubuntu version. 

Suggestion on the mailing list: disable vblank syncing. I was unable to do
this. The environment variable setting that works for glxgears does not
influence the behaviour of openscad. I was unable to achieve disabling the
option in the X server. 

Suggestions on the IRC channel led me to try installing an older version. I
created an chrooted ubuntu 14.04 environment. The openscad in there provides
reasonable performance. 

I then recompiled the current git version of openscad in the chrooted 14.04
environment, and that too provides reasonable performance. 

So: Without changing the X server (or its configuration) it is possible to
achieve good performance. Also, the source of openscad is not the culprit, but
the libraries linked to. 

This does not mean that it is not an openscad bug: It could very well be that
openscad requests a feature that was unimplemented on earlier libraries.</pre>
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

--1447671588.B0FA4c0.29656--

--===============1726110179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1726110179==--
