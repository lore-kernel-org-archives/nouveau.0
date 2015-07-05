From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91232] New: Torchlight 1&2 (in Wine): glitchy models
 when hardware skinning enabled
Date: Sun, 05 Jul 2015 07:08:42 +0000
Message-ID: <bug-91232-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0296258591=="
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


--===============0296258591==
Content-Type: multipart/alternative; boundary="1436080122.302CCDc0.4708"; charset="UTF-8"


--1436080122.302CCDc0.4708
Date: Sun, 5 Jul 2015 07:08:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91232

            Bug ID: 91232
           Summary: Torchlight 1&2 (in Wine): glitchy models when hardware
                    skinning enabled
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 116947
  --> https://bugs.freedesktop.org/attachment.cgi?id=116947&action=edit
screenshot, comparison (nouveau vs. nvidia blob)

I believe this is different from bug #90887, I tried the patch from that bug
and it didn't help.
Models in Torchlight 1 and 2 are rendered incorrectly, they have lots of
flashing, white rectangles on them.Disabling hardware skinning in the options
menu makes the problem go away.
I see similar issues in some other games as well so this bug may affect
multiple games.

I tried and reproduced the problem in Mesa 10.1 and 10.4 too.
The software renderer doesn't have the problem.
Disabling shader optimization doesn't help.
The trace replays correctly on Nvidia blob 340.76.

Trace (uncompressed 43 MB):
https://drive.google.com/open?id=0B-tTbLKBl-tORHV2eGdleGk1dzQ

Fedora 22 32-bit
Kernel 4.0.6-300.fc22.i686+PAE
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Mesa 10.6-branchpoint-826-gff0a41b
libdrm-2.4.62-1-g676c806
xf86-video-nouveau-1.0.11-23-gdfd827c

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1436080122.302CCDc0.4708
Date: Sun, 5 Jul 2015 07:08:42 +0000
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
   title="NEW - Torchlight 1&amp;2 (in Wine): glitchy models when hardware skinning enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91232">91232</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Torchlight 1&amp;2 (in Wine): glitchy models when hardware skinning enabled
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>gyebro69&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116947" name="attach_116947" title="screenshot, comparison (nouveau vs. nvidia blob)">attachment 116947</a> <a href="attachment.cgi?id=116947&amp;action=edit" title="screenshot, comparison (nouveau vs. nvidia blob)">[details]</a></span>
screenshot, comparison (nouveau vs. nvidia blob)

I believe this is different from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="show_bug.cgi?id=90887">bug #90887</a>, I tried the patch from that bug
and it didn't help.
Models in Torchlight 1 and 2 are rendered incorrectly, they have lots of
flashing, white rectangles on them.Disabling hardware skinning in the options
menu makes the problem go away.
I see similar issues in some other games as well so this bug may affect
multiple games.

I tried and reproduced the problem in Mesa 10.1 and 10.4 too.
The software renderer doesn't have the problem.
Disabling shader optimization doesn't help.
The trace replays correctly on Nvidia blob 340.76.

Trace (uncompressed 43 MB):
<a href="https://drive.google.com/open?id=0B-tTbLKBl-tORHV2eGdleGk1dzQ">https://drive.google.com/open?id=0B-tTbLKBl-tORHV2eGdleGk1dzQ</a>

Fedora 22 32-bit
Kernel 4.0.6-300.fc22.i686+PAE
VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250] (rev a2)
(prog-if 00 [VGA controller])
Mesa 10.6-branchpoint-826-gff0a41b
libdrm-2.4.62-1-g676c806
xf86-video-nouveau-1.0.11-23-gdfd827c</pre>
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

--1436080122.302CCDc0.4708--

--===============0296258591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0296258591==--
