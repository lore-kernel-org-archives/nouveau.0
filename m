From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91523] New: [NVE7] driver cannot initialize
 gpu(failed to parse ramcfg data)
Date: Sat, 01 Aug 2015 17:04:32 +0000
Message-ID: <bug-91523-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0816709953=="
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


--===============0816709953==
Content-Type: multipart/alternative; boundary="1438448672.2dE11.14017"; charset="UTF-8"


--1438448672.2dE11.14017
Date: Sat, 1 Aug 2015 17:04:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91523

            Bug ID: 91523
           Summary: [NVE7] driver cannot initialize gpu(failed to parse
                    ramcfg data)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: iliyabo-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 117481
  --> https://bugs.freedesktop.org/attachment.cgi?id=117481&action=edit
dmesg log with enabled nouveau debug

When the kernel tries to load the nouveau kernel module during boot, it fails
with "failed to parse ramcfg data"(see attached logs). It also happens when I
try to load the module manually later. This is a bug which occurred between
kernel 3.17 and 3.18(downgrading to 3.17 fixes the problem, each version above
doesn't work). I'm using nvidia gt645m(gk107) on a Lenovo z500 with intel
i5-3230 processor. OS: tested on arch linux(both stock & -ck kernel) and fedora
22. Let me know if any other info would be needed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1438448672.2dE11.14017
Date: Sat, 1 Aug 2015 17:04:32 +0000
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
   title="NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcfg data)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91523">91523</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] driver cannot initialize gpu(failed to parse ramcfg data)
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
          <td>blocker
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
          <td>iliyabo&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=117481" name="attach_117481" title="dmesg log with enabled nouveau debug">attachment 117481</a> <a href="attachment.cgi?id=117481&amp;action=edit" title="dmesg log with enabled nouveau debug">[details]</a></span>
dmesg log with enabled nouveau debug

When the kernel tries to load the nouveau kernel module during boot, it fails
with &quot;failed to parse ramcfg data&quot;(see attached logs). It also happens when I
try to load the module manually later. This is a bug which occurred between
kernel 3.17 and 3.18(downgrading to 3.17 fixes the problem, each version above
doesn't work). I'm using nvidia gt645m(gk107) on a Lenovo z500 with intel
i5-3230 processor. OS: tested on arch linux(both stock &amp; -ck kernel) and fedora
22. Let me know if any other info would be needed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438448672.2dE11.14017--

--===============0816709953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0816709953==--
