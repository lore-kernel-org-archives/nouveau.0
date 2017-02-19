From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99858] New: disp: ERROR 4 [INVALID_VALUE] 84 [] chid
 0 mthd 0828 data 000099bb
Date: Sun, 19 Feb 2017 08:24:00 +0000
Message-ID: <bug-99858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1312616726=="
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


--===============1312616726==
Content-Type: multipart/alternative; boundary="14874926400.A1F09f.19532";
 charset="UTF-8"


--14874926400.A1F09f.19532
Date: Sun, 19 Feb 2017 08:24:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99858

            Bug ID: 99858
           Summary: disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 0828
                    data 000099bb
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ulr_bugs_freedesktop_org-h0gHADR2m04Yx6x61TORfoQuADTiUCJX@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 129736
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129736&action=3Dedit
Output of dmesg for start with kernel 4.9

I get a blank screen and the error=20
[    3.857342] nouveau 0000:03:00.0: disp: ERROR 4 [INVALID_VALUE] 84 [] ch=
id 0
mthd 0828 data 000099bb
in kernel log while starting the system. The problem occurs with kernel 4.9.
With kernel 3.16 the system starts fine. With kernel 4.10 (debian experimen=
tal)
I get a blank screen too but another error within the log:
[    6.123790] nouveau 0000:03:00.0: DRM: EVO timeout

I will directly add the output of dmesg for start with kernel 4.9 and try to
add the outputs of dmesg for start with kernels 4.10 and 3.16 later. Also I
will try to add the output of dpkg -l for possibly needed information about
versions of other packages.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14874926400.A1F09f.19532
Date: Sun, 19 Feb 2017 08:24:00 +0000
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
   title=3D"NEW - disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 0828 data=
 000099bb"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99858">99858</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>disp: ERROR 4 [INVALID_VALUE] 84 [] chid 0 mthd 0828 data 000=
099bb
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
          <td>ulr_bugs_freedesktop_org&#64;moehrkevielfalt.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129736=
" name=3D"attach_129736" title=3D"Output of dmesg for start with kernel 4.9=
">attachment 129736</a> <a href=3D"attachment.cgi?id=3D129736&amp;action=3D=
edit" title=3D"Output of dmesg for start with kernel 4.9">[details]</a></sp=
an>
Output of dmesg for start with kernel 4.9

I get a blank screen and the error=20
[    3.857342] nouveau 0000:03:00.0: disp: ERROR 4 [INVALID_VALUE] 84 [] ch=
id 0
mthd 0828 data 000099bb
in kernel log while starting the system. The problem occurs with kernel 4.9.
With kernel 3.16 the system starts fine. With kernel 4.10 (debian experimen=
tal)
I get a blank screen too but another error within the log:
[    6.123790] nouveau 0000:03:00.0: DRM: EVO timeout

I will directly add the output of dmesg for start with kernel 4.9 and try to
add the outputs of dmesg for start with kernels 4.10 and 3.16 later. Also I
will try to add the output of dpkg -l for possibly needed information about
versions of other packages.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14874926400.A1F09f.19532--

--===============1312616726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1312616726==--
