From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93177] New: [NV96] Xorg hangs (rarely),
 seems related to flash player use
Date: Mon, 30 Nov 2015 18:16:41 +0000
Message-ID: <bug-93177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0276283446=="
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


--===============0276283446==
Content-Type: multipart/alternative; boundary="1448907401.db8Ab1.9360"; charset="UTF-8"


--1448907401.db8Ab1.9360
Date: Mon, 30 Nov 2015 18:16:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93177

            Bug ID: 93177
           Summary: [NV96] Xorg hangs (rarely), seems related to flash
                    player use
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: urjaman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 120214
  --> https://bugs.freedesktop.org/attachment.cgi?id=120214&action=edit
3rd crash dmesg

OS: Arch Linux

package versions:
xf86-video-nouveau 1.0.11+31+g1ff13a9-1
mesa 11.0.6-1
linux 4.2.5-1
libdrm 2.4.65-1
xorg-server 1.18.0-3

card:
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96 [GeForce 9400
GT] [10de:065b] (rev a1) (prog-if 00 [VGA controller])

The behaviour is that X freezes except for the mouse pointer and ssh is still
accessible but i wasnt succesful at killing the X server - one attempt at a
reboot also hung somewhere..

I have 3 dmesg's and one Xorg.log (for the last dmesg) for this, but cant
figure out how to attach more than one file, so firstly there's the 3rd
dmesg...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448907401.db8Ab1.9360
Date: Mon, 30 Nov 2015 18:16:41 +0000
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
   title="NEW - [NV96] Xorg hangs (rarely), seems related to flash player use"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93177">93177</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96] Xorg hangs (rarely), seems related to flash player use
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
          <td>urjaman&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120214" name="attach_120214" title="3rd crash dmesg">attachment 120214</a> <a href="attachment.cgi?id=120214&amp;action=edit" title="3rd crash dmesg">[details]</a></span>
3rd crash dmesg

OS: Arch Linux

package versions:
xf86-video-nouveau 1.0.11+31+g1ff13a9-1
mesa 11.0.6-1
linux 4.2.5-1
libdrm 2.4.65-1
xorg-server 1.18.0-3

card:
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G96 [GeForce 9400
GT] [10de:065b] (rev a1) (prog-if 00 [VGA controller])

The behaviour is that X freezes except for the mouse pointer and ssh is still
accessible but i wasnt succesful at killing the X server - one attempt at a
reboot also hung somewhere..

I have 3 dmesg's and one Xorg.log (for the last dmesg) for this, but cant
figure out how to attach more than one file, so firstly there's the 3rd
dmesg...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448907401.db8Ab1.9360--

--===============0276283446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0276283446==--
