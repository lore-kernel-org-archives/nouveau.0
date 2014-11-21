From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86539] New: [NVAC] Trying to register nv_backlight
 after NV96 did it
Date: Fri, 21 Nov 2014 22:19:45 +0000
Message-ID: <bug-86539-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0876874101=="
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


--===============0876874101==
Content-Type: multipart/alternative; boundary="1416608385.4a7d1.13934"; charset="UTF-8"


--1416608385.4a7d1.13934
Date: Fri, 21 Nov 2014 22:19:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86539

            Bug ID: 86539
           Summary: [NVAC] Trying to register nv_backlight after NV96 did
                    it
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

Created attachment 109822
  --> https://bugs.freedesktop.org/attachment.cgi?id=109822&action=edit
dmesg

Hardware:
* 9600M GT (NV96)
* 9400M (NVAC)

Tested on
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=1a9d15cb98ec30dfba43bbe65022f22d978ea9fc

Options: nouveau.noaccel=1 (otherwise falling into bug 86537)

When using the NV96 card to drive the display, the NVAC still tries to register
nv_backlight even though it isn't driving a display and the NV96 already
registered it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416608385.4a7d1.13934
Date: Fri, 21 Nov 2014 22:19:45 +0000
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
   title="NEW - [NVAC] Trying to register nv_backlight after NV96 did it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86539">86539</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAC] Trying to register nv_backlight after NV96 did it
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
        <pre>Created <span class=""><a href="attachment.cgi?id=109822" name="attach_109822" title="dmesg">attachment 109822</a> <a href="attachment.cgi?id=109822&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Hardware:
* 9600M GT (NV96)
* 9400M (NVAC)

Tested on
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=1a9d15cb98ec30dfba43bbe65022f22d978ea9fc">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=1a9d15cb98ec30dfba43bbe65022f22d978ea9fc</a>

Options: nouveau.noaccel=1 (otherwise falling into <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="show_bug.cgi?id=86537">bug 86537</a>)

When using the NV96 card to drive the display, the NVAC still tries to register
nv_backlight even though it isn't driving a display and the NV96 already
registered it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416608385.4a7d1.13934--

--===============0876874101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0876874101==--
