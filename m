From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103421] New: Kernel 4.13+ nouveau breaks screen
	output
Date: Mon, 23 Oct 2017 13:28:16 +0000
Message-ID: <bug-103421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833740142=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0833740142==
Content-Type: multipart/alternative; boundary="15087652961.0C7dB39dA.28635";
 charset="UTF-8"


--15087652961.0C7dB39dA.28635
Date: Mon, 23 Oct 2017 13:28:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103421

            Bug ID: 103421
           Summary: Kernel 4.13+ nouveau breaks screen output
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kbaikov-IBi9RG/b67k@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135010
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135010&action=3Dedit
kernel log

There is a regression with my

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF119 [NVS
310] [10de:107d] (rev a1)

where I would not get any graphics output anymore with Linux kernel
4.13.x, not even (framebuffer) text consoles.

There is a NULL pointer dereference around nvkm_dp_train_drive
visible in dmesg (attached)

and looking at the nouveau.ko disassembly, the faulting instruction was
a call to a variable address e.g. from
drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:
        ior->func->dp.drive(ior, i, ocfg.pc, ocfg.dc,
                                    ocfg.pe, ocfg.tx_pu);

which was introduced in commit af85389c614ae
so maybe you have a hint at what might be wrong or how to further debug
this problem...


With 4.12.8, there was a different NULL pointer deref but some working
graphics.
I also tried 4.14-rc3 or such but that still had broken graphics.

Thanks in advance for any help

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15087652961.0C7dB39dA.28635
Date: Mon, 23 Oct 2017 13:28:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.13+ nouveau breaks screen output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103421">103421</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel 4.13+ nouveau breaks screen output
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
          <td>kbaikov&#64;suse.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135010=
" name=3D"attach_135010" title=3D"kernel log">attachment 135010</a> <a href=
=3D"attachment.cgi?id=3D135010&amp;action=3Dedit" title=3D"kernel log">[det=
ails]</a></span>
kernel log

There is a regression with my

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF119 [NVS
310] [10de:107d] (rev a1)

where I would not get any graphics output anymore with Linux kernel
4.13.x, not even (framebuffer) text consoles.

There is a NULL pointer dereference around nvkm_dp_train_drive
visible in dmesg (attached)

and looking at the nouveau.ko disassembly, the faulting instruction was
a call to a variable address e.g. from
drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:
        ior-&gt;func-&gt;dp.drive(ior, i, ocfg.pc, ocfg.dc,
                                    ocfg.pe, ocfg.tx_pu);

which was introduced in commit af85389c614ae
so maybe you have a hint at what might be wrong or how to further debug
this problem...


With 4.12.8, there was a different NULL pointer deref but some working
graphics.
I also tried 4.14-rc3 or such but that still had broken graphics.

Thanks in advance for any help</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15087652961.0C7dB39dA.28635--

--===============0833740142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0833740142==--
