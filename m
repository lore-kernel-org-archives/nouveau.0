From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Thu, 28 Dec 2017 02:24:02 +0000
Message-ID: <bug-75985-8800-4EBIhp1xPY@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0819381299=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0819381299==
Content-Type: multipart/alternative; boundary="15144279052.BB4aaa.22120";
 charset="UTF-8"


--15144279052.BB4aaa.22120
Date: Thu, 28 Dec 2017 02:25:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #26 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
Created attachment 136416
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136416&action=3Dedit
Kernel module to toggle audio function

Thank you, Daniel. I was too blind to see the attachment.
Attaching some c/p work using/abusing bbswitch as a framework and your enab=
le
code. So works like that. Creates a handle /proc/acpi/nvhda which takes ON =
and
OFF. Since my hardware doesn't have outputs I can't test it farther than
turning on and off.
Can be loaded and used while the proprietary driver is loaded to be used for
further investigations.
- Does the prop. driver react to this immediately, i.e. make audio work?
- If not, does plugging out/in the hdmi cable make it work?
- Are any pci config space changes noticeable?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15144279052.BB4aaa.22120
Date: Thu, 28 Dec 2017 02:25:05 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c26">Commen=
t # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136416=
" name=3D"attach_136416" title=3D"Kernel module to toggle audio function">a=
ttachment 136416</a> <a href=3D"attachment.cgi?id=3D136416&amp;action=3Dedi=
t" title=3D"Kernel module to toggle audio function">[details]</a></span>
Kernel module to toggle audio function

Thank you, Daniel. I was too blind to see the attachment.
Attaching some c/p work using/abusing bbswitch as a framework and your enab=
le
code. So works like that. Creates a handle /proc/acpi/nvhda which takes ON =
and
OFF. Since my hardware doesn't have outputs I can't test it farther than
turning on and off.
Can be loaded and used while the proprietary driver is loaded to be used for
further investigations.
- Does the prop. driver react to this immediately, i.e. make audio work?
- If not, does plugging out/in the hdmi cable make it work?
- Are any pci config space changes noticeable?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15144279052.BB4aaa.22120--

--===============0819381299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0819381299==--
