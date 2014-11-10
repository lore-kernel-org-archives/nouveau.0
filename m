From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86109] New: kernel oops after lightdm startup
Date: Mon, 10 Nov 2014 13:41:30 +0000
Message-ID: <bug-86109-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1296241459=="
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


--===============1296241459==
Content-Type: multipart/alternative; boundary="1415626890.bDC31.13928"; charset="UTF-8"


--1415626890.bDC31.13928
Date: Mon, 10 Nov 2014 13:41:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86109

            Bug ID: 86109
           Summary: kernel oops after lightdm startup
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: etienne-cucUXmzBMd0@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 109220
  --> https://bugs.freedesktop.org/attachment.cgi?id=109220&action=edit
kernel oops photo

Since debian testing kernel update from 3.16.2 to 3.16.5 (also reproduced with
3.16.7), I sometimes (~3/4) get a crash few seconds after lightdm launch.

It seems to be a reproduction of that (bisected) fedora bug:
https://bugzilla.redhat.com/show_bug.cgi?id=1158061

Hardware name: Sony Corporation VPCZ12L9E/VAIO, BIOS R3031C3 10/04/2011
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02)
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 330M]
(rev a2)

thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415626890.bDC31.13928
Date: Mon, 10 Nov 2014 13:41:30 +0000
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
   title="NEW - kernel oops after lightdm startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86109">86109</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kernel oops after lightdm startup
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
          <td>etienne&#64;zol.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109220" name="attach_109220" title="kernel oops photo">attachment 109220</a> <a href="attachment.cgi?id=109220&amp;action=edit" title="kernel oops photo">[details]</a></span>
kernel oops photo

Since debian testing kernel update from 3.16.2 to 3.16.5 (also reproduced with
3.16.7), I sometimes (~3/4) get a crash few seconds after lightdm launch.

It seems to be a reproduction of that (bisected) fedora bug:
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1158061">https://bugzilla.redhat.com/show_bug.cgi?id=1158061</a>

Hardware name: Sony Corporation VPCZ12L9E/VAIO, BIOS R3031C3 10/04/2011
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02)
01:00.0 VGA compatible controller: NVIDIA Corporation GT216M [GeForce GT 330M]
(rev a2)

thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415626890.bDC31.13928--

--===============1296241459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1296241459==--
