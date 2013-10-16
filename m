From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70510] Xorg crash on KDE init
Date: Wed, 16 Oct 2013 20:26:53 +0000
Message-ID: <bug-70510-8800-z8gQ1rtMKV@http.bugs.freedesktop.org/>
References: <bug-70510-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1781906367=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70510-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1781906367==
Content-Type: multipart/alternative; boundary="1381955213.f62f2.8548"; charset="us-ascii"


--1381955213.f62f2.8548
Date: Wed, 16 Oct 2013 20:26:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70510

--- Comment #11 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to comment #10)
>  Unfortunately that did not work as expected:
[...]
> Nonetheless this does not give me debuginfo yet.

Maybe you should provide valid values for variables:

osc getbinaries --debug -d debuginfo openSUSE:13.1 Mesa standard i586
Mesa-debuginfo-9.2.1-61.4.1.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1
xorg-x11-driver-video-nouveau standard i586
xorg-x11-driver-video-nouveau-debuginfo-1.0.9-3.1.2.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 xorg-x11-server standard
i586 xorg-x11-server-debuginfo-7.6_1.14.3-2.1.3.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 libdrm standard i586
libdrm2-debuginfo-2.4.46-3.2.2.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 libdrm standard i586
libdrm_nouveau2-debuginfo-2.4.46-3.2.2.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 libdrm standard i586
libkms1-debuginfo-2.4.46-3.2.2.i586.rpm

cd debuginfo

sudo zypper in $(ls)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381955213.f62f2.8548
Date: Wed, 16 Oct 2013 20:26:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg crash on KDE init"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg crash on KDE init"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510">bug 70510</a>
              from <span class="vcard"><a class="email" href="mailto:johannesobermayr&#64;gmx.de" title="Johannes Obermayr &lt;johannesobermayr&#64;gmx.de&gt;"> <span class="fn">Johannes Obermayr</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70510#c10">comment #10</a>)
<span class="quote">&gt;  Unfortunately that did not work as expected:</span >
[...]
<span class="quote">&gt; Nonetheless this does not give me debuginfo yet.</span >

Maybe you should provide valid values for variables:

osc getbinaries --debug -d debuginfo openSUSE:13.1 Mesa standard i586
Mesa-debuginfo-9.2.1-61.4.1.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1
xorg-x11-driver-video-nouveau standard i586
xorg-x11-driver-video-nouveau-debuginfo-1.0.9-3.1.2.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 xorg-x11-server standard
i586 xorg-x11-server-debuginfo-7.6_1.14.3-2.1.3.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 libdrm standard i586
libdrm2-debuginfo-2.4.46-3.2.2.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 libdrm standard i586
libdrm_nouveau2-debuginfo-2.4.46-3.2.2.i586.rpm
osc getbinaries --debug -d debuginfo openSUSE:13.1 libdrm standard i586
libkms1-debuginfo-2.4.46-3.2.2.i586.rpm

cd debuginfo

sudo zypper in $(ls)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381955213.f62f2.8548--

--===============1781906367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1781906367==--
