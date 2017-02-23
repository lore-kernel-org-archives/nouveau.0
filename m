From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99922] [NVE4] [regression,
 bisected] 4.10 (atomic): X shows black screen with cursor after
 monitors turn off
Date: Thu, 23 Feb 2017 14:33:59 +0000
Message-ID: <bug-99922-8800-CDVWoSpXSp@http.bugs.freedesktop.org/>
References: <bug-99922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0440888671=="
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


--===============0440888671==
Content-Type: multipart/alternative; boundary="14878604391.bb87bD3.32261";
 charset="UTF-8"


--14878604391.bb87bD3.32261
Date: Thu, 23 Feb 2017 14:33:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99922

--- Comment #3 from kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org ---
Created attachment 129872
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129872&action=3Dedit
problematic xorg log on 4.10 with three monitors

(Apologies for the email spam; I'm new to bugzilla. I'll refrain from posti=
ng
any more attachments to avoid more spam. If you need the vbios/other dmesgs=
 or
Xorg logs, just ask.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14878604391.bb87bD3.32261
Date: Thu, 23 Feb 2017 14:33:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922">bug 99922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kevin&#64;potatofrom.space" title=3D"kevin&#64;potatofrom.space">kevin&#64;=
potatofrom.space</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129872=
" name=3D"attach_129872" title=3D"problematic xorg log on 4.10 with three m=
onitors">attachment 129872</a> <a href=3D"attachment.cgi?id=3D129872&amp;ac=
tion=3Dedit" title=3D"problematic xorg log on 4.10 with three monitors">[de=
tails]</a></span>
problematic xorg log on 4.10 with three monitors

(Apologies for the email spam; I'm new to bugzilla. I'll refrain from posti=
ng
any more attachments to avoid more spam. If you need the vbios/other dmesgs=
 or
Xorg logs, just ask.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14878604391.bb87bD3.32261--

--===============0440888671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0440888671==--
