From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] Xv video support is black on NVidia NVa8
 Chipset in latest git [fixed with patch]
Date: Sat, 17 Nov 2012 21:03:08 +0000
Message-ID: <bug-51579-8800-VCcSesgTEV@http.bugs.freedesktop.org/>
References: <bug-51579-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1851053031=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51579-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1851053031==
Content-Type: multipart/alternative; boundary="1353186188.1e8ba2Cd2.28996"; charset="us-ascii"


--1353186188.1e8ba2Cd2.28996
Date: Sat, 17 Nov 2012 21:03:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51579

--- Comment #20 from Boris Reisig <boris-Ky47UMpZSVQ@public.gmane.org> ---
If it's not effecting your NVa8 board, maybe its something specific to the
GT218 [ION] nvidia cards or NVaX chipsets? (NVIDIA Corporation GT218 [ION] (rev
a2)). I just rebuilt the following packages from git today (11/17/2012) to see
if it helped and nothing.

linux kernel 3.7.0rc6
libdrm 2.4.40+ (mesa/drm git)
nouveau/xf86-video-nouveau (1.0.4+ git)
xorg (X.Org X Server 1.13.99)

Is their any other info or details I can do to provide you any extra
information?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353186188.1e8ba2Cd2.28996
Date: Sat, 17 Nov 2012 21:03:08 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Xv video support is black on NVidia NVa8 Chipset in latest git [fixed with patch]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Xv video support is black on NVidia NVa8 Chipset in latest git [fixed with patch]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
              from <span class="vcard"><a class="email" href="mailto:boris&#64;boris.ca" title="Boris Reisig &lt;boris&#64;boris.ca&gt;"> <span class="fn">Boris Reisig</span></a>
</span></b>
        <pre>If it's not effecting your NVa8 board, maybe its something specific to the
GT218 [ION] nvidia cards or NVaX chipsets? (NVIDIA Corporation GT218 [ION] (rev
a2)). I just rebuilt the following packages from git today (11/17/2012) to see
if it helped and nothing.

linux kernel 3.7.0rc6
libdrm 2.4.40+ (mesa/drm git)
nouveau/xf86-video-nouveau (1.0.4+ git)
xorg (X.Org X Server 1.13.99)

Is their any other info or details I can do to provide you any extra
information?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353186188.1e8ba2Cd2.28996--

--===============1851053031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1851053031==--
