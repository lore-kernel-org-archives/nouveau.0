From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98677] [NVAC] iMac9,
 1 effective backlight brightness range changes after S3
Date: Fri, 11 Nov 2016 22:45:03 +0000
Message-ID: <bug-98677-8800-VIpm7LGURW@http.bugs.freedesktop.org/>
References: <bug-98677-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2103018124=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98677-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2103018124==
Content-Type: multipart/alternative; boundary="14789043030.94d5B6dbe.23812";
 charset="UTF-8"


--14789043030.94d5B6dbe.23812
Date: Fri, 11 Nov 2016 22:45:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98677

--- Comment #10 from Jeffery Miller <jefferym-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 127925
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127925&action=3Dedit
Force NV50_PDISP_SOR_PWM_DIV when setting brightness for the iMac9,1 subven=
dor

This patch always sets the div to 0x1 for the device on this machine. It al=
lows
consistent behavior between the first boot of the system and after a resume.

I apply it on each backlight change mimicking the nvidia blob's behavior in
this case. However, the nvidia blob sets the value to 0x17 in my observatio=
ns.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14789043030.94d5B6dbe.23812
Date: Fri, 11 Nov 2016 22:45:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] iMac9,1 effective backlight brightness range chang=
es after S3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98677#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] iMac9,1 effective backlight brightness range chang=
es after S3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98677">bug 98677<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jefferym&#64;gmail.com" title=3D"Jeffery Miller &lt;jefferym&#64;gmail.com&=
gt;"> <span class=3D"fn">Jeffery Miller</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127925=
" name=3D"attach_127925" title=3D"Force NV50_PDISP_SOR_PWM_DIV when setting=
 brightness for the iMac9,1 subvendor">attachment 127925</a> <a href=3D"att=
achment.cgi?id=3D127925&amp;action=3Dedit" title=3D"Force NV50_PDISP_SOR_PW=
M_DIV when setting brightness for the iMac9,1 subvendor">[details]</a></spa=
n> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D98677&amp;attachment=3D=
127925'>[review]</a>
Force NV50_PDISP_SOR_PWM_DIV when setting brightness for the iMac9,1 subven=
dor

This patch always sets the div to 0x1 for the device on this machine. It al=
lows
consistent behavior between the first boot of the system and after a resume.

I apply it on each backlight change mimicking the nvidia blob's behavior in
this case. However, the nvidia blob sets the value to 0x17 in my observatio=
ns.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14789043030.94d5B6dbe.23812--

--===============2103018124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2103018124==--
