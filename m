From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 29 Mar 2013 14:30:47 +0000
Message-ID: <bug-59168-8800-uk7ovKkOhl@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1880881017=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1880881017==
Content-Type: multipart/alternative; boundary="1364567447.Bc471B3.14608"; charset="us-ascii"


--1364567447.Bc471B3.14608
Date: Fri, 29 Mar 2013 14:30:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #32 from rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org ---
I have this problem also.  After suspend/resume firefox, gvim, and other
graphic applications do not display.  The window only displays the border and
no graphics
inside the window.

I tried the patch without success.
The workaround 'nouveau.noaccel=1' makes suspend/resume work.  Also, some
screen corruption in a graphic application is not occurring.

lspci 
01:00.0 VGA compatible controller: NVIDIA Corporation Device 0dfc (rev a1)
01:00.0 0300: 10de:0dfc (rev a1)

[  237.125651] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c1e00a1
[  237.125659] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF108 (NVC1)
[  237.125664] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0

libdrm_nouveau2-2.4.42-1.1.1.x86_64
xorg-x11-driver-video-nouveau-1.0.6-2.1.1.x86_64
kernel 3.7.10

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364567447.Bc471B3.14608
Date: Fri, 29 Mar 2013 14:30:47 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:rcoe&#64;wi.rr.com" title="rcoe&#64;wi.rr.com">rcoe&#64;wi.rr.com</a>
</span></b>
        <pre>I have this problem also.  After suspend/resume firefox, gvim, and other
graphic applications do not display.  The window only displays the border and
no graphics
inside the window.

I tried the patch without success.
The workaround 'nouveau.noaccel=1' makes suspend/resume work.  Also, some
screen corruption in a graphic application is not occurring.

lspci 
01:00.0 VGA compatible controller: NVIDIA Corporation Device 0dfc (rev a1)
01:00.0 0300: 10de:0dfc (rev a1)

[  237.125651] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c1e00a1
[  237.125659] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF108 (NVC1)
[  237.125664] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0

libdrm_nouveau2-2.4.42-1.1.1.x86_64
xorg-x11-driver-video-nouveau-1.0.6-2.1.1.x86_64
kernel 3.7.10</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364567447.Bc471B3.14608--

--===============1880881017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1880881017==--
