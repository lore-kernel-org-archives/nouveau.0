From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Mon, 16 Jun 2014 08:07:24 +0000
Message-ID: <bug-79823-8800-Yi3Qu0Wo74@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2068573802=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2068573802==
Content-Type: multipart/alternative; boundary="1402906044.36b66b50.29825"; charset="us-ascii"


--1402906044.36b66b50.29825
Date: Mon, 16 Jun 2014 08:07:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #15 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
Bug not only with mozilla, but glxinfo:

-- Version 10.2.1:
 freeze afrer end of (normal) output, and print this to stderr:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 0000000140 0000000154
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000004
nouveau:        0x00020000
nouveau:        0x00000000

-- Version 10.2.1 (reverted patch):
 seems to bee ok.

-- Version 10.1.4 (from repository):
 segfault after (normal) output, in dmesg:
glxinfo[9715]: segfault at 88 ip b6d88829 sp bffa4420 error 4 in
nouveau_dri.so[b6a37000+64a000]

-- Last revision before bisected commit:
 seems to bee ok.

-- Bisected commit:
 freeze, stderr:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 0000000140 0000000154
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000004
nouveau:        0x00020000
nouveau:        0x00000000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402906044.36b66b50.29825
Date: Mon, 16 Jun 2014 08:07:24 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>Bug not only with mozilla, but glxinfo:

-- Version 10.2.1:
 freeze afrer end of (normal) output, and print this to stderr:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 0000000140 0000000154
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000004
nouveau:        0x00020000
nouveau:        0x00000000

-- Version 10.2.1 (reverted patch):
 seems to bee ok.

-- Version 10.1.4 (from repository):
 segfault after (normal) output, in dmesg:
glxinfo[9715]: segfault at 88 ip b6d88829 sp bffa4420 error 4 in
nouveau_dri.so[b6a37000+64a000]

-- Last revision before bisected commit:
 seems to bee ok.

-- Bisected commit:
 freeze, stderr:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 0000000140 0000000154
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000004
nouveau:        0x00020000
nouveau:        0x00000000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402906044.36b66b50.29825--

--===============2068573802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2068573802==--
