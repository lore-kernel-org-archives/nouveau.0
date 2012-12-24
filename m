From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] NV34 Fx5200 & NVC3/Quadro 2000M
 both fail to resume with commit 'convert to exec engine,
 and improve channel sync'
Date: Mon, 24 Dec 2012 08:36:25 +0000
Message-ID: <bug-50121-8800-5H9E93iZjA@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0178549408=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0178549408==
Content-Type: multipart/alternative; boundary="1356338185.17f0de3.16902"; charset="us-ascii"


--1356338185.17f0de3.16902
Date: Mon, 24 Dec 2012 08:36:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #27 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just tested v3.8-rc1 + nouveau @ 'drm/nouveau/fan: handle the cases where we
are outside of the linear zone' on this FX5200.

Especially 'drm/nouveau/bios: cache ramcfg strap on later chipsets' looked
promising (even though I don't have a recent chipset... there was hope...).

Things did not regress further. First suspend works most of the time, second
suspend crashes. Symptoms did change a bit. When resume eventually completes, I
do not see a frozen/unresponsive desktop but the screen goes black with
red/green (I don't think i saw any blue) pixels scattered all over it. Density
was really low, so maybe 200 pixels on the entire screen? These pixels did not
move or alterate or anything, it was pretty static and boring actually.

But I recommend Michael and francoism to test latest HEAD as the mentioned
commit might fix your issue's???

I will add a dmesg from v3.8rc1 kernel for your viewing convenience. This is a
dmesg from syslog, not from the 'dmesg' command!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356338185.17f0de3.16902
Date: Mon, 24 Dec 2012 08:36:25 +0000
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
   title="NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both fail to resume with commit 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both fail to resume with commit 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Just tested v3.8-rc1 + nouveau &#64; 'drm/nouveau/fan: handle the cases where we
are outside of the linear zone' on this FX5200.

Especially 'drm/nouveau/bios: cache ramcfg strap on later chipsets' looked
promising (even though I don't have a recent chipset... there was hope...).

Things did not regress further. First suspend works most of the time, second
suspend crashes. Symptoms did change a bit. When resume eventually completes, I
do not see a frozen/unresponsive desktop but the screen goes black with
red/green (I don't think i saw any blue) pixels scattered all over it. Density
was really low, so maybe 200 pixels on the entire screen? These pixels did not
move or alterate or anything, it was pretty static and boring actually.

But I recommend Michael and francoism to test latest HEAD as the mentioned
commit might fix your issue's???

I will add a dmesg from v3.8rc1 kernel for your viewing convenience. This is a
dmesg from syslog, not from the 'dmesg' command!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356338185.17f0de3.16902--

--===============0178549408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0178549408==--
