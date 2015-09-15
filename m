From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92013] New: [NVA0] 4.3-rc1 fan set to full speed
 after resume from suspend
Date: Tue, 15 Sep 2015 21:57:16 +0000
Message-ID: <bug-92013-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1619066795=="
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


--===============1619066795==
Content-Type: multipart/alternative; boundary="1442354236.632D1.17196"; charset="UTF-8"


--1442354236.632D1.17196
Date: Tue, 15 Sep 2015 21:57:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92013

            Bug ID: 92013
           Summary: [NVA0] 4.3-rc1 fan set to full speed after resume from
                    suspend
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: boohbah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118294
  --> https://bugs.freedesktop.org/attachment.cgi?id=118294&action=edit
lspci -vv

The fan on my GeForce GTX 275 turns on to full speed after resuming from
suspend.
This started with Linux 4.3-rc1, and does not happen in 4.2-rc8.
I am running Arch Linux and compiling my kernel from git, with mesa 10.6.7 and
xf86-video-nouveau 1.0.11.
I have attached lspci output for my card.
I did a git bisect and came up with this:
first bad commit: [2aa5eac5163fedf09f2d61992cb5ea4d75bec9db] drm/nouveau/i2c:
transition pad/ports away from being based on nvkm_object

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442354236.632D1.17196
Date: Tue, 15 Sep 2015 21:57:16 +0000
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
   title="NEW - [NVA0] 4.3-rc1 fan set to full speed after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92013">92013</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA0] 4.3-rc1 fan set to full speed after resume from suspend
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
          <td>boohbah&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118294" name="attach_118294" title="lspci -vv">attachment 118294</a> <a href="attachment.cgi?id=118294&amp;action=edit" title="lspci -vv">[details]</a></span>
lspci -vv

The fan on my GeForce GTX 275 turns on to full speed after resuming from
suspend.
This started with Linux 4.3-rc1, and does not happen in 4.2-rc8.
I am running Arch Linux and compiling my kernel from git, with mesa 10.6.7 and
xf86-video-nouveau 1.0.11.
I have attached lspci output for my card.
I did a git bisect and came up with this:
first bad commit: [2aa5eac5163fedf09f2d61992cb5ea4d75bec9db] drm/nouveau/i2c:
transition pad/ports away from being based on nvkm_object</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442354236.632D1.17196--

--===============1619066795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1619066795==--
