From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99922] [NVE4] [regression,
 bisected] 4.10 (atomic): X shows black screen with cursor after
 monitors turn off
Date: Mon, 24 Apr 2017 00:06:15 +0000
Message-ID: <bug-99922-8800-lLnd7crsS2@http.bugs.freedesktop.org/>
References: <bug-99922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0562541847=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0562541847==
Content-Type: multipart/alternative; boundary="14929923752.826AFc0.17738";
 charset="UTF-8"


--14929923752.826AFc0.17738
Date: Mon, 24 Apr 2017 00:06:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99922

--- Comment #13 from mish <bradford-2EFSgMI5/k+zXXRXsSGsVFaTQe2KTcn/@public.gmane.org> ---
I had the same issue on an Intel-based system.  I managed to overcome it by
changing the BIOS video settings from PEG to IGD.  I have to use the on-boa=
rd
video to see the BIOS bootup screen, but once Linux takes over, both of my
monitors work fine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14929923752.826AFc0.17738
Date: Mon, 24 Apr 2017 00:06:15 +0000
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
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922">bug 99922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bradford&#64;inthelightphotos.com" title=3D"mish &lt;bradford&#64;intheligh=
tphotos.com&gt;"> <span class=3D"fn">mish</span></a>
</span></b>
        <pre>I had the same issue on an Intel-based system.  I managed to o=
vercome it by
changing the BIOS video settings from PEG to IGD.  I have to use the on-boa=
rd
video to see the BIOS bootup screen, but once Linux takes over, both of my
monitors work fine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14929923752.826AFc0.17738--

--===============0562541847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0562541847==--
