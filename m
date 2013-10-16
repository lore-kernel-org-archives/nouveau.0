From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70510] Xorg crash on KDE init
Date: Wed, 16 Oct 2013 14:25:09 +0000
Message-ID: <bug-70510-8800-NHidcRgaPC@http.bugs.freedesktop.org/>
References: <bug-70510-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1165523962=="
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


--===============1165523962==
Content-Type: multipart/alternative; boundary="1381933508.05b7B1.7996"; charset="us-ascii"


--1381933508.05b7B1.7996
Date: Wed, 16 Oct 2013 14:25:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70510

--- Comment #3 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Well the crash has to do with enabling an external screen via the xrandr
extension. If I boot from xinit via startkde into KDE then it does not crash
unless I enable an external monitor (as done at me by default). Since enabling
an external monitor is not supported until long (Bug 47556) this is not a
regression; "crashes regularely" should mean "always; in any case.". Xorg.0.log
and dmesg will follow; can and will also re-test without nouveau_vieux_dri.so.

kernel-3.11.3-1.1-default
libdmr2-2.4.46-3.2.2
libdrm-nouveau2-2.4.46-3.2.2
Mesa-9.2.1-61.4.1
Mesa-libGLESv2-2-9.2.1-61.4.1
DirectFB-Mesa-1.6.3-4.1.3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381933508.05b7B1.7996
Date: Wed, 16 Oct 2013 14:25:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg crash on KDE init"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510">bug 70510</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Well the crash has to do with enabling an external screen via the xrandr
extension. If I boot from xinit via startkde into KDE then it does not crash
unless I enable an external monitor (as done at me by default). Since enabling
an external monitor is not supported until long (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] nouveau driver can't handle xrandr requests"
   href="show_bug.cgi?id=47556">Bug 47556</a>) this is not a
regression; &quot;crashes regularely&quot; should mean &quot;always; in any case.&quot;. Xorg.0.log
and dmesg will follow; can and will also re-test without nouveau_vieux_dri.so.

kernel-3.11.3-1.1-default
libdmr2-2.4.46-3.2.2
libdrm-nouveau2-2.4.46-3.2.2
Mesa-9.2.1-61.4.1
Mesa-libGLESv2-2-9.2.1-61.4.1
DirectFB-Mesa-1.6.3-4.1.3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381933508.05b7B1.7996--

--===============1165523962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1165523962==--
