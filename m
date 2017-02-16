From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] G96: system hang on video playback via vdpau
Date: Thu, 16 Feb 2017 17:30:12 +0000
Message-ID: <bug-95282-8800-MQOq9rl90J@http.bugs.freedesktop.org/>
References: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833987707=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95282-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0833987707==
Content-Type: multipart/alternative; boundary="14872662111.f1fE9A33.6851";
 charset="UTF-8"


--14872662111.f1fE9A33.6851
Date: Thu, 16 Feb 2017 17:30:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95282

--- Comment #19 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
VDPAU - playback still crashing / not implemented with 4.10.0-rc8+ (Wed Feb=
 15
13:10:17 CET 2017) for the NV50 family (tested with G96GLM [Quadro FX 770M]=
. As
vdpau support for this card is on your ToDo-list at
nouveau.freedesktop.org/wiki/VideoAcceleration at least for the iso6avc1mp41
and the H.264 codecs I have tested videos with these codecs  and both videos
have crashed with xine -V vdpau right after xine started having done some
init-steps first. I will add a screenshot of these messages shortly.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14872662111.f1fE9A33.6851
Date: Thu, 16 Feb 2017 17:30:11 +0000
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
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282">bug 95282<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
estellnb&#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elste=
l.org&gt;"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>VDPAU - playback still crashing / not implemented with 4.10.0-=
rc8+ (Wed Feb 15
13:10:17 CET 2017) for the NV50 family (tested with G96GLM [Quadro FX 770M]=
. As
vdpau support for this card is on your ToDo-list at
nouveau.freedesktop.org/wiki/VideoAcceleration at least for the iso6avc1mp41
and the H.264 codecs I have tested videos with these codecs  and both videos
have crashed with xine -V vdpau right after xine started having done some
init-steps first. I will add a screenshot of these messages shortly.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14872662111.f1fE9A33.6851--

--===============0833987707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0833987707==--
