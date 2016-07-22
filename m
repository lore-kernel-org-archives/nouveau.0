From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Fri, 22 Jul 2016 23:29:04 +0000
Message-ID: <bug-94990-8800-OdrlBJEIbP@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0402453275=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0402453275==
Content-Type: multipart/alternative; boundary="14692301450.ceE8.12273";
 charset="UTF-8"


--14692301450.ceE8.12273
Date: Fri, 22 Jul 2016 23:29:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

Ilia Guterman <amfernusus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |amfernusus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #36 from Ilia Guterman <amfernusus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 125265
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125265&action=3Dedit
DMESG with pci_msi=3Doff nouveau.config=3DNvForcePost=3D1 nouveau.debug=3Dt=
race

Asus Z77 and GTX970, it seems the first fifo caused by
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/nouveau/nvkm/=
subdev/secboot/base.c#L142

changing the value to 0x0 allowed the machine to boot, still with lots of
errors.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14692301450.ceE8.12273
Date: Fri, 22 Jul 2016 23:29:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:amfernusu=
s&#64;gmail.com" title=3D"Ilia Guterman &lt;amfernusus&#64;gmail.com&gt;"> =
<span class=3D"fn">Ilia Guterman</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>amfernusus&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c36">Commen=
t # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
amfernusus&#64;gmail.com" title=3D"Ilia Guterman &lt;amfernusus&#64;gmail.c=
om&gt;"> <span class=3D"fn">Ilia Guterman</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125265=
" name=3D"attach_125265" title=3D"DMESG with pci_msi=3Doff nouveau.config=
=3DNvForcePost=3D1 nouveau.debug=3Dtrace">attachment 125265</a> <a href=3D"=
attachment.cgi?id=3D125265&amp;action=3Dedit" title=3D"DMESG with pci_msi=
=3Doff nouveau.config=3DNvForcePost=3D1 nouveau.debug=3Dtrace">[details]</a=
></span>
DMESG with pci_msi=3Doff nouveau.config=3DNvForcePost=3D1 nouveau.debug=3Dt=
race

Asus Z77 and GTX970, it seems the first fifo caused by
<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/no=
uveau/nvkm/subdev/secboot/base.c#L142">https://github.com/torvalds/linux/bl=
ob/master/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/base.c#L142</a>

changing the value to 0x0 allowed the machine to boot, still with lots of
errors.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14692301450.ceE8.12273--

--===============0402453275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0402453275==--
