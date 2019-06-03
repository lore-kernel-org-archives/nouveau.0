From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Mon, 03 Jun 2019 12:46:56 +0000
Message-ID: <bug-75985-8800-EIMmWJ1XBt@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1903301841=="
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


--===============1903301841==
Content-Type: multipart/alternative; boundary="15595660160.49FbF6cD6.8345"
Content-Transfer-Encoding: 7bit


--15595660160.49FbF6cD6.8345
Date: Mon, 3 Jun 2019 12:46:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #76 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to jonasz from comment #75)
> Hi guys,
>=20
> I have a dell t7610 centOS installation with two K6000 gpus with the late=
st
> available firmware installed. These gpus have two DisplayPorts and two DVI
> ports each.

This bug report is about the sound device of notebooks. So this does not ap=
ply
to your desktop hardware. You're probably hitting this nvidia bug:
https://devtalk.nvidia.com/default/topic/1044547/linux/audio-problems-with-=
the-415-18-drivers/
The workaround would be to downgrade the driver to v410 or v390.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595660160.49FbF6cD6.8345
Date: Mon, 3 Jun 2019 12:46:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c76">Commen=
t # 76</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>(In reply to jonasz from <a href=3D"show_bug.cgi?id=3D75985#c7=
5">comment #75</a>)
<span class=3D"quote">&gt; Hi guys,
&gt;=20
&gt; I have a dell t7610 centOS installation with two K6000 gpus with the l=
atest
&gt; available firmware installed. These gpus have two DisplayPorts and two=
 DVI
&gt; ports each.</span >

This bug report is about the sound device of notebooks. So this does not ap=
ply
to your desktop hardware. You're probably hitting this nvidia bug:
<a href=3D"https://devtalk.nvidia.com/default/topic/1044547/linux/audio-pro=
blems-with-the-415-18-drivers/">https://devtalk.nvidia.com/default/topic/10=
44547/linux/audio-problems-with-the-415-18-drivers/</a>
The workaround would be to downgrade the driver to v410 or v390.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595660160.49FbF6cD6.8345--

--===============1903301841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1903301841==--
