From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89991] New: Flickering and other image corruption
Date: Sun, 12 Apr 2015 07:42:20 +0000
Message-ID: <bug-89991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1665251540=="
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


--===============1665251540==
Content-Type: multipart/alternative; boundary="1428824540.bbAda5b1.11374"; charset="UTF-8"


--1428824540.bbAda5b1.11374
Date: Sun, 12 Apr 2015 07:42:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89991

            Bug ID: 89991
           Summary: Flickering and other image corruption
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tom.winterhalder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115033
  --> https://bugs.freedesktop.org/attachment.cgi?id=115033&action=edit
dmesg output

Hello
I have some heavy flickering on my notebook screen.

Chipset: GT215 (NVA3)
Family : NV50

During a chat on IRC I got notice about the "disp/nv50-: fix push buffers in
vram" patch which I also applied to the kernel.

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=1c27bd1522d33075c9d9b625182530ea2bffd09b

After building a custom kernel with this patch applied the problem is still
there.

Is there anything else I could do?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428824540.bbAda5b1.11374
Date: Sun, 12 Apr 2015 07:42:20 +0000
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
   title="NEW - Flickering and other image corruption"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89991">89991</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Flickering and other image corruption
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
          <td>tom.winterhalder&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115033" name="attach_115033" title="dmesg output">attachment 115033</a> <a href="attachment.cgi?id=115033&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

Hello
I have some heavy flickering on my notebook screen.

Chipset: GT215 (NVA3)
Family : NV50

During a chat on IRC I got notice about the &quot;disp/nv50-: fix push buffers in
vram&quot; patch which I also applied to the kernel.

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=1c27bd1522d33075c9d9b625182530ea2bffd09b">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=1c27bd1522d33075c9d9b625182530ea2bffd09b</a>

After building a custom kernel with this patch applied the problem is still
there.

Is there anything else I could do?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428824540.bbAda5b1.11374--

--===============1665251540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1665251540==--
