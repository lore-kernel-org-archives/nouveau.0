From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41333] Nvidia GTA 240 card (NVA3) locks up when
 loading nouveau.ko module
Date: Sat, 19 Jan 2013 21:34:30 +0000
Message-ID: <bug-41333-8800-sD35ibyPTJ@http.bugs.freedesktop.org/>
References: <bug-41333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849189416=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-41333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0849189416==
Content-Type: multipart/alternative; boundary="1358631270.fFdb1Ee83.12663"; charset="us-ascii"


--1358631270.fFdb1Ee83.12663
Date: Sat, 19 Jan 2013 21:34:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=41333

--- Comment #7 from cybjit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Still a problem on my GT240. I get screen corruption when X starts up. The card
is fanless.

Ubuntu 13.04

linux: 9816a78 drm/nouveau/devinit: ensure legacy vga control is enabled during
post

drm: 303ca37 radeon: Fix 1D tiling layout on SI.

xf86-video-nouveau: 8f934fa bump to 1.0.6

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358631270.fFdb1Ee83.12663
Date: Sat, 19 Jan 2013 21:34:30 +0000
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
   title="NEW --- - Nvidia GTA 240 card (NVA3) locks up when loading nouveau.ko module"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=41333#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nvidia GTA 240 card (NVA3) locks up when loading nouveau.ko module"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=41333">bug 41333</a>
              from <span class="vcard"><a class="email" href="mailto:cybjit&#64;gmail.com" title="cybjit&#64;gmail.com">cybjit&#64;gmail.com</a>
</span></b>
        <pre>Still a problem on my GT240. I get screen corruption when X starts up. The card
is fanless.

Ubuntu 13.04

linux: 9816a78 drm/nouveau/devinit: ensure legacy vga control is enabled during
post

drm: 303ca37 radeon: Fix 1D tiling layout on SI.

xf86-video-nouveau: 8f934fa bump to 1.0.6</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358631270.fFdb1Ee83.12663--

--===============0849189416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0849189416==--
