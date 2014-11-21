From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86537] New: [NV96] Unable to handle page request
 from nv50_crtc_prepare
Date: Fri, 21 Nov 2014 21:39:46 +0000
Message-ID: <bug-86537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2039531239=="
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


--===============2039531239==
Content-Type: multipart/alternative; boundary="1416605986.1e10b361.27970"; charset="UTF-8"


--1416605986.1e10b361.27970
Date: Fri, 21 Nov 2014 21:39:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86537

            Bug ID: 86537
           Summary: [NV96] Unable to handle page request from
                    nv50_crtc_prepare
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pierre.morrow-GANU6spQydw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 109818
  --> https://bugs.freedesktop.org/attachment.cgi?id=109818&action=edit
dmesg

Hardware:
* 9600M GT (NV96)
* 9400M (NVAC)

Tested on something newer than 3.17-rc5.
Though it is not visible in the dmesg, I set "config=NvForcePost=1" which had
no effect on the issue.

When using the NV96 to drive the display - this is set before booting -, a BUG:
unable to handle kernel page request is thrown by nv50_crtc_prepare after the
fb was allocated for the NV96 - the NVAC wasn't initialised yet.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416605986.1e10b361.27970
Date: Fri, 21 Nov 2014 21:39:46 +0000
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
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537">86537</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96] Unable to handle page request from nv50_crtc_prepare
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>pierre.morrow&#64;free.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109818" name="attach_109818" title="dmesg">attachment 109818</a> <a href="attachment.cgi?id=109818&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Hardware:
* 9600M GT (NV96)
* 9400M (NVAC)

Tested on something newer than 3.17-rc5.
Though it is not visible in the dmesg, I set &quot;config=NvForcePost=1&quot; which had
no effect on the issue.

When using the NV96 to drive the display - this is set before booting -, a BUG:
unable to handle kernel page request is thrown by nv50_crtc_prepare after the
fb was allocated for the NV96 - the NVAC wasn't initialised yet.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416605986.1e10b361.27970--

--===============2039531239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2039531239==--
