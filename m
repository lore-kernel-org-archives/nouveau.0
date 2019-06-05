From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110679] va-api scaling with nv50-class cards
 incomplete?
Date: Wed, 05 Jun 2019 16:38:04 +0000
Message-ID: <bug-110679-8800-eoglF5evTx@http.bugs.freedesktop.org/>
References: <bug-110679-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1462766297=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110679-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1462766297==
Content-Type: multipart/alternative; boundary="15597526840.92CEA3A.22150"
Content-Transfer-Encoding: 7bit


--15597526840.92CEA3A.22150
Date: Wed, 5 Jun 2019 16:38:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110679

--- Comment #3 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
using those two command lines

XVMC_VL=3D1 LIBVA_MESSAGING_LEVEL=3D2 LIBVA_TRACE=3D/dev/shm/log_file ./ffm=
peg
-vaapi_device /dev/dri/renderD128 -benchmark -c:v libdav1d   -i
/mnt/sdb1/Stream2_AV1_720p_3.2mbps.webm  -vf
format=3Dnv12,hwupload,scale_vaapi=3Dw=3D3840:h=3D2160:mode=3Dhq,hwdownload=
,format=3Dyuv420p
-map 0:v:0  /dev/shm/1.avi

---------working--------

 LIBVA_MESSAGING_LEVEL=3D2 LIBVA_TRACE=3D/dev/shm/log_file_no_vl ./ffmpeg
-vaapi_device /dev/dri/renderD128 -benchmark -c:v libdav1d   -i
/mnt/sdb1/Stream2_AV1_720p_3.2mbps.webm  -vf
format=3Dnv12,hwupload,scale_vaapi=3Dw=3D3840:h=3D2160:mode=3Dhq,hwdownload=
,format=3Dyuv420p
-map 0:v:0  /dev/shm/1.avi

--------failing----------

I got two trace files, will attach them.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15597526840.92CEA3A.22150
Date: Wed, 5 Jun 2019 16:38:04 +0000
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
   title=3D"NEW - va-api scaling with nv50-class cards incomplete?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110679#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - va-api scaling with nv50-class cards incomplete?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110679">bug 11067=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>using those two command lines

XVMC_VL=3D1 LIBVA_MESSAGING_LEVEL=3D2 LIBVA_TRACE=3D/dev/shm/log_file ./ffm=
peg
-vaapi_device /dev/dri/renderD128 -benchmark -c:v libdav1d   -i
/mnt/sdb1/Stream2_AV1_720p_3.2mbps.webm  -vf
format=3Dnv12,hwupload,scale_vaapi=3Dw=3D3840:h=3D2160:mode=3Dhq,hwdownload=
,format=3Dyuv420p
-map 0:v:0  /dev/shm/1.avi

---------working--------

 LIBVA_MESSAGING_LEVEL=3D2 LIBVA_TRACE=3D/dev/shm/log_file_no_vl ./ffmpeg
-vaapi_device /dev/dri/renderD128 -benchmark -c:v libdav1d   -i
/mnt/sdb1/Stream2_AV1_720p_3.2mbps.webm  -vf
format=3Dnv12,hwupload,scale_vaapi=3Dw=3D3840:h=3D2160:mode=3Dhq,hwdownload=
,format=3Dyuv420p
-map 0:v:0  /dev/shm/1.avi

--------failing----------

I got two trace files, will attach them.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15597526840.92CEA3A.22150--

--===============1462766297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1462766297==--
