From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Mon, 16 Jun 2014 08:27:50 +0000
Message-ID: <bug-79823-8800-nYkpnd8nKq@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1011869163=="
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


--===============1011869163==
Content-Type: multipart/alternative; boundary="1402907270.FDc1d0.3141"; charset="us-ascii"


--1402907270.FDc1d0.3141
Date: Mon, 16 Jun 2014 08:27:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #16 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
glxtest (from bug #94465):

-- Version 10.1.4 (from repository):
VENDOR
nouveau
RENDERER
Gallium 0.4 on NV34
VERSION
1.5 Mesa 10.1.4
TFP
TRUE

-- Version 10.2.1:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 000000012c 0000000140
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000003
nouveau:        0x00020000
nouveau:        0x00000000
 (freeze)

-- Version 10.2.1 (reverted patch):
VENDOR
nouveau
RENDERER
Gallium 0.4 on NV34
VERSION
1.5 Mesa 10.2.1
TFP
TRUE

-- Last revision before bisected commit:
VENDOR
nouveau
RENDERER
Gallium 0.4 on NV34
VERSION
1.5 Mesa 10.2.0-devel (git-5bf90cb)
TFP
TRUE

-- Bisected commit:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 000000012c 0000000140
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000003
nouveau:        0x00020000
nouveau:        0x00000000
 (freeze)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402907270.FDc1d0.3141
Date: Mon, 16 Jun 2014 08:27:50 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>glxtest (from bug #94465):

-- Version 10.1.4 (from repository):
VENDOR
nouveau
RENDERER
Gallium 0.4 on NV34
VERSION
1.5 Mesa 10.1.4
TFP
TRUE

-- Version 10.2.1:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 000000012c 0000000140
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000003
nouveau:        0x00020000
nouveau:        0x00000000
 (freeze)

-- Version 10.2.1 (reverted patch):
VENDOR
nouveau
RENDERER
Gallium 0.4 on NV34
VERSION
1.5 Mesa 10.2.1
TFP
TRUE

-- Last revision before bisected commit:
VENDOR
nouveau
RENDERER
Gallium 0.4 on NV34
VERSION
1.5 Mesa 10.2.0-devel (git-5bf90cb)
TFP
TRUE

-- Bisected commit:
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000002 00000004 00000004 00000000
nouveau: ch0: psh 00000000 000000012c 0000000140
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00000003
nouveau:        0x00020000
nouveau:        0x00000000
 (freeze)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402907270.FDc1d0.3141--

--===============1011869163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1011869163==--
