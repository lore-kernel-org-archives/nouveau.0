From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87361] New: [NV4C] Kernel lock-up after booting to
 desktop in Fedora 20 & 21 (Nvidia Geforce 6100 IGP)
Date: Tue, 16 Dec 2014 14:12:40 +0000
Message-ID: <bug-87361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0869293314=="
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


--===============0869293314==
Content-Type: multipart/alternative; boundary="1418739160.6a0e0.8595"; charset="UTF-8"


--1418739160.6a0e0.8595
Date: Tue, 16 Dec 2014 14:12:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87361

            Bug ID: 87361
           Summary: [NV4C] Kernel lock-up after booting to desktop in
                    Fedora 20 & 21 (Nvidia Geforce 6100 IGP)
           Product: Mesa
           Version: 10.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jajadekroon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

Created attachment 110906
  --> https://bugs.freedesktop.org/attachment.cgi?id=110906&action=edit
Dump of the Kmsg while the lock-up occurred

When using Fedora 20 and 21 I discovered a bug which was causing my complete
desktop system to freeze (kernel freeze).
The videocard which is integrated on the motherboard is a Nvidia Geforce 6100
IGP.
Maybe this bug affects multiple distros/kernels as well but I haven't tested
others besides Fedora 20 and 21.
I have applied a kmsg dump to this post as well, which was taken while the
freeze occured.

To solve the problem the following things have been tried in cooperation with
nouveau IRC user (RSpliet):
- Because the kmsg dump complained about PVPE support, while this graphics chip
doesn't have PVPE support, first applying nouveau.config=PVP=0 as kernel
parameter has been tried. Unfortunately this still caused the lock-up.
- After the above attempt the kernel parameter nouveau.config=NvMSI=0 had been
applied, without the nouveau.config=PVP=0 parameter. This time it rendered the
desktop without problems.

IRC user RSpliet suggested that NvMSI may need blacklisting for the NV4C chips.

For more information please dont hessitate to contact me.

Greetings Jan Jasper de Kroon

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418739160.6a0e0.8595
Date: Tue, 16 Dec 2014 14:12:40 +0000
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
   title="NEW - [NV4C] Kernel lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361">87361</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV4C] Kernel lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.3
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
          <td>jajadekroon&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=110906" name="attach_110906" title="Dump of the Kmsg while the lock-up occurred">attachment 110906</a> <a href="attachment.cgi?id=110906&amp;action=edit" title="Dump of the Kmsg while the lock-up occurred">[details]</a></span>
Dump of the Kmsg while the lock-up occurred

When using Fedora 20 and 21 I discovered a bug which was causing my complete
desktop system to freeze (kernel freeze).
The videocard which is integrated on the motherboard is a Nvidia Geforce 6100
IGP.
Maybe this bug affects multiple distros/kernels as well but I haven't tested
others besides Fedora 20 and 21.
I have applied a kmsg dump to this post as well, which was taken while the
freeze occured.

To solve the problem the following things have been tried in cooperation with
nouveau IRC user (RSpliet):
- Because the kmsg dump complained about PVPE support, while this graphics chip
doesn't have PVPE support, first applying nouveau.config=PVP=0 as kernel
parameter has been tried. Unfortunately this still caused the lock-up.
- After the above attempt the kernel parameter nouveau.config=NvMSI=0 had been
applied, without the nouveau.config=PVP=0 parameter. This time it rendered the
desktop without problems.

IRC user RSpliet suggested that NvMSI may need blacklisting for the NV4C chips.

For more information please dont hessitate to contact me.

Greetings Jan Jasper de Kroon</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418739160.6a0e0.8595--

--===============0869293314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0869293314==--
