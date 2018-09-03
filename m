From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107504] Xorg segmentation fault at
 RRProviderAutoConfigGpuScreen
Date: Mon, 03 Sep 2018 08:14:33 +0000
Message-ID: <bug-107504-8800-fzHLKWurQW@http.bugs.freedesktop.org/>
References: <bug-107504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0484408196=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107504-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0484408196==
Content-Type: multipart/alternative; boundary="15359624730.eb4B3.29730"
Content-Transfer-Encoding: 7bit


--15359624730.eb4B3.29730
Date: Mon, 3 Sep 2018 08:14:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107504

--- Comment #1 from tianhang <1748215448-9uewiaClKEY@public.gmane.org> ---
Xorg segmentation fault at RRProviderAutoConfigGpuScreen
this problem has also occured on on my machine with nvidia cards(GM204GL [T=
esla
M60])

does the nouveau driver support this nvidia card(GM204GL [Tesla M60]) ?
https://nouveau.freedesktop.org/wiki/CodeNames/ there is no infomation about
GM204GL or Telsa M60

OS version :centos 7.4
nvidia card :
# lspci -k -s 06:00.0
06:00.0 VGA compatible controller: NVIDIA Corporation GM204GL [Tesla M60] (=
rev
a1)
        Subsystem: Huawei Corporation Device 2060
        Kernel modules: nouveau

Look forward to your reply

thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15359624730.eb4B3.29730
Date: Mon, 3 Sep 2018 08:14:33 +0000
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
   title=3D"NEW - Xorg segmentation fault at RRProviderAutoConfigGpuScreen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107504#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg segmentation fault at RRProviderAutoConfigGpuScreen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107504">bug 10750=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
1748215448&#64;qq.com" title=3D"tianhang &lt;1748215448&#64;qq.com&gt;"> <s=
pan class=3D"fn">tianhang</span></a>
</span></b>
        <pre>Xorg segmentation fault at RRProviderAutoConfigGpuScreen
this problem has also occured on on my machine with nvidia cards(GM204GL [T=
esla
M60])

does the nouveau driver support this nvidia card(GM204GL [Tesla M60]) ?
<a href=3D"https://nouveau.freedesktop.org/wiki/CodeNames/">https://nouveau=
.freedesktop.org/wiki/CodeNames/</a> there is no infomation about
GM204GL or Telsa M60

OS version :centos 7.4
nvidia card :
# lspci -k -s 06:00.0
06:00.0 VGA compatible controller: NVIDIA Corporation GM204GL [Tesla M60] (=
rev
a1)
        Subsystem: Huawei Corporation Device 2060
        Kernel modules: nouveau

Look forward to your reply

thanks</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15359624730.eb4B3.29730--

--===============0484408196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0484408196==--
