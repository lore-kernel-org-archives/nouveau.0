From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107963] New: kernel rejected pushbuf: Invalid
 argument
Date: Mon, 17 Sep 2018 19:17:03 +0000
Message-ID: <bug-107963-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0591246733=="
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


--===============0591246733==
Content-Type: multipart/alternative; boundary="15372118241.c6b46a.5895"
Content-Transfer-Encoding: 7bit


--15372118241.c6b46a.5895
Date: Mon, 17 Sep 2018 19:17:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107963

            Bug ID: 107963
           Summary: kernel rejected pushbuf: Invalid argument
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mikhail.v.gavrilov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 141604
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141604&action=3Dedit
system log

$ uname -r
4.19.0-0.rc3.git3.1.fc30.x86_64

nouveau: kernel rejected pushbuf: Invalid argument
nouveau: ch12: krec 0 pushes 3 bufs 13 relocs 0
nouveau: ch12: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch12: buf 00000001 00000006 00000004 00000000 00000004
nouveau: ch12: buf 00000002 00000007 00000002 00000002 00000002
nouveau: ch12: buf 00000003 0000000b 00000002 00000002 00000002
nouveau: ch12: buf 00000004 0000000a 00000002 00000002 00000000
nouveau 0000:09:00.0: WebKitWebProces[2368]: multiple instances of buffer 7=
 on
validation list
nouveau 0000:09:00.0: WebKitWebProces[2368]: validate_init
nouveau 0000:09:00.0: WebKitWebProces[2368]: validate: -22
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1900 data 0004721c
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1904 data 0fac6881
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1908 data 00086ff4
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 190c data 03560000
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1910 data 01e00000
nouveau: ch12: buf 00000005 00000008 00000002 00000002 00000000
nouveau: ch12: buf 00000006 00000026 00000004 00000004 00000000
nouveau: ch12: buf 00000007 0000002b 00000002 00000000 00000002
nouveau: ch12: buf 00000008 0000002a 00000002 00000000 00000002
nouveau: ch12: buf 00000009 00000012 00000002 00000002 00000000
nouveau: ch12: buf 0000000a 0000001a 00000002 00000002 00000000
nouveau: ch12: buf 0000000b 0000001c 00000002 00000002 00000000
nouveau: ch12: buf 0000000c 00000025 00000002 00000002 00000000
nouveau: ch12: psh 00000000 00000085cc 0000008de8

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15372118241.c6b46a.5895
Date: Mon, 17 Sep 2018 19:17:04 +0000
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
   title=3D"NEW - kernel rejected pushbuf: Invalid argument"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107963">107963</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kernel rejected pushbuf: Invalid argument
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
          <td>mikhail.v.gavrilov&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141604=
" name=3D"attach_141604" title=3D"system log">attachment 141604</a> <a href=
=3D"attachment.cgi?id=3D141604&amp;action=3Dedit" title=3D"system log">[det=
ails]</a></span>
system log

$ uname -r
4.19.0-0.rc3.git3.1.fc30.x86_64

nouveau: kernel rejected pushbuf: Invalid argument
nouveau: ch12: krec 0 pushes 3 bufs 13 relocs 0
nouveau: ch12: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch12: buf 00000001 00000006 00000004 00000000 00000004
nouveau: ch12: buf 00000002 00000007 00000002 00000002 00000002
nouveau: ch12: buf 00000003 0000000b 00000002 00000002 00000002
nouveau: ch12: buf 00000004 0000000a 00000002 00000002 00000000
nouveau 0000:09:00.0: WebKitWebProces[2368]: multiple instances of buffer 7=
 on
validation list
nouveau 0000:09:00.0: WebKitWebProces[2368]: validate_init
nouveau 0000:09:00.0: WebKitWebProces[2368]: validate: -22
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1900 data 0004721c
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1904 data 0fac6881
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1908 data 00086ff4
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 190c data 03560000
nouveau 0000:09:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD]
nouveau 0000:09:00.0: gr: 00100000 [] ch 12 [003f528000 WebKitWebProces[236=
8]]
subc 3 class 8597 mthd 1910 data 01e00000
nouveau: ch12: buf 00000005 00000008 00000002 00000002 00000000
nouveau: ch12: buf 00000006 00000026 00000004 00000004 00000000
nouveau: ch12: buf 00000007 0000002b 00000002 00000000 00000002
nouveau: ch12: buf 00000008 0000002a 00000002 00000000 00000002
nouveau: ch12: buf 00000009 00000012 00000002 00000002 00000000
nouveau: ch12: buf 0000000a 0000001a 00000002 00000002 00000000
nouveau: ch12: buf 0000000b 0000001c 00000002 00000002 00000000
nouveau: ch12: buf 0000000c 00000025 00000002 00000002 00000000
nouveau: ch12: psh 00000000 00000085cc 0000008de8</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15372118241.c6b46a.5895--

--===============0591246733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0591246733==--
