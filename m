From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] New: [NVAC] Flickering screen on 1920x1080
 monitor with 9400M in MacbookPro 5, 5
Date: Sat, 10 Jan 2015 15:47:15 +0000
Message-ID: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0145723121=="
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


--===============0145723121==
Content-Type: multipart/alternative; boundary="1420904835.EfBA0e6d1.32501"; charset="UTF-8"


--1420904835.EfBA0e6d1.32501
Date: Sat, 10 Jan 2015 15:47:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88272

            Bug ID: 88272
           Summary: [NVAC] Flickering screen on 1920x1080 monitor with
                    9400M in MacbookPro 5,5
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nils-OGj7Q/wiCjeELgA04lAiVw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 112063
  --> https://bugs.freedesktop.org/attachment.cgi?id=112063&action=edit
dmesg without drm.debug

I'm using nouveau from the git kernel to drive the GeForce 9400M, the only
graphics adapter in my MacbookPro 5,5.

My Dell U2312HM monitor (1920x1080@60, attached via DisplayPort -> DisplayPort
cable) won't show a static picture, moving pictures make the flickering even
worse. The problem still stands in the highest pstate level and with only the
DisplayPort as active output. I also tried a DisplayPort -> VGA adapter and got
the same result.

Included two dmesg:

1) Without drm.debug
2) With drm.debug=0xf, flooded

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420904835.EfBA0e6d1.32501
Date: Sat, 10 Jan 2015 15:47:15 +0000
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
   title="NEW - [NVAC] Flickering screen on 1920x1080 monitor with 9400M in MacbookPro 5,5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88272">88272</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAC] Flickering screen on 1920x1080 monitor with 9400M in MacbookPro 5,5
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
          <td>nils&#64;famalex.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=112063" name="attach_112063" title="dmesg without drm.debug">attachment 112063</a> <a href="attachment.cgi?id=112063&amp;action=edit" title="dmesg without drm.debug">[details]</a></span>
dmesg without drm.debug

I'm using nouveau from the git kernel to drive the GeForce 9400M, the only
graphics adapter in my MacbookPro 5,5.

My Dell U2312HM monitor (1920x1080&#64;60, attached via DisplayPort -&gt; DisplayPort
cable) won't show a static picture, moving pictures make the flickering even
worse. The problem still stands in the highest pstate level and with only the
DisplayPort as active output. I also tried a DisplayPort -&gt; VGA adapter and got
the same result.

Included two dmesg:

1) Without drm.debug
2) With drm.debug=0xf, flooded</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420904835.EfBA0e6d1.32501--

--===============0145723121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0145723121==--
