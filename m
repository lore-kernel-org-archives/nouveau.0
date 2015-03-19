From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89679] New: [NV50] Portal/Half-Life 2 will not start
 (native Steam)
Date: Thu, 19 Mar 2015 14:43:35 +0000
Message-ID: <bug-89679-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1631273508=="
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


--===============1631273508==
Content-Type: multipart/alternative; boundary="1426776215.4b5d113c0.17891"; charset="UTF-8"


--1426776215.4b5d113c0.17891
Date: Thu, 19 Mar 2015 14:43:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89679

            Bug ID: 89679
           Summary: [NV50] Portal/Half-Life 2 will not start (native
                    Steam)
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nick.tenney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 114474
  --> https://bugs.freedesktop.org/attachment.cgi?id=114474&action=edit
Dump from Steam crash

Not particularly sure how to debug, but both titles crash immediately after
loading the menu screen. I confirmed that r600g with the same mesa build on
another machine had no issues. Let me know if there are any relevant logs I can
provide

Details:
1.17.1 xserver
1.0.11 xf86-video-nouveau
68854.2372275 mesa-git
4.0rc4 linux-git

Only relevant line in dmesg:
[ 6389.605899] streaming_clien[6094]: segfault at 0 ip 00000000f75ee410 sp
00000000ffe6c9d0 error 4 in streaming_client[f7576000+195000]

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1426776215.4b5d113c0.17891
Date: Thu, 19 Mar 2015 14:43:35 +0000
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
   title="NEW - [NV50] Portal/Half-Life 2 will not start (native Steam)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89679">89679</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV50] Portal/Half-Life 2 will not start (native Steam)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>nick.tenney&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=114474" name="attach_114474" title="Dump from Steam crash">attachment 114474</a> <a href="attachment.cgi?id=114474&amp;action=edit" title="Dump from Steam crash">[details]</a></span>
Dump from Steam crash

Not particularly sure how to debug, but both titles crash immediately after
loading the menu screen. I confirmed that r600g with the same mesa build on
another machine had no issues. Let me know if there are any relevant logs I can
provide

Details:
1.17.1 xserver
1.0.11 xf86-video-nouveau
68854.2372275 mesa-git
4.0rc4 linux-git

Only relevant line in dmesg:
[ 6389.605899] streaming_clien[6094]: segfault at 0 ip 00000000f75ee410 sp
00000000ffe6c9d0 error 4 in streaming_client[f7576000+195000]</pre>
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

--1426776215.4b5d113c0.17891--

--===============1631273508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1631273508==--
