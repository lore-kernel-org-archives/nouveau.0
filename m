From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60007] BUG: nouveau crashes in various ways in
 32-bits Fedora 18
Date: Tue, 29 Jan 2013 09:53:46 +0000
Message-ID: <bug-60007-8800-dIY8reea1A@http.bugs.freedesktop.org/>
References: <bug-60007-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0793544075=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60007-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0793544075==
Content-Type: multipart/alternative; boundary="1359453226.030C21.17237"; charset="us-ascii"


--1359453226.030C21.17237
Date: Tue, 29 Jan 2013 09:53:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60007

--- Comment #1 from Cornel Panceac <cpanceac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
all right, i've forgot some things:

a line interesting in the messages file:

BUG: unable to handle kernel paging request at fb880000

and later:

 WARNING: at drivers/gpu/drm/nouveau/core/core/mm.c:242
nouveau_mm_fini+0x47/0x50 [nouveau]()

Video card is:

$ lspci -nn | grep -i vga
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G98M [Quadro NVS
160M] [10de:06eb] (rev a1)

kernel is:

$ uname -a
Linux localhost.localdomain 3.7.4-204.fc18.i686.PAE #1 SMP Wed Jan 23 16:58:41
UTC 2013 i686 i686 i386 GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359453226.030C21.17237
Date: Tue, 29 Jan 2013 09:53:46 +0000
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
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007">bug 60007</a>
              from <span class="vcard"><a class="email" href="mailto:cpanceac&#64;gmail.com" title="Cornel Panceac &lt;cpanceac&#64;gmail.com&gt;"> <span class="fn">Cornel Panceac</span></a>
</span></b>
        <pre>all right, i've forgot some things:

a line interesting in the messages file:

BUG: unable to handle kernel paging request at fb880000

and later:

 WARNING: at drivers/gpu/drm/nouveau/core/core/mm.c:242
nouveau_mm_fini+0x47/0x50 [nouveau]()

Video card is:

$ lspci -nn | grep -i vga
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G98M [Quadro NVS
160M] [10de:06eb] (rev a1)

kernel is:

$ uname -a
Linux localhost.localdomain 3.7.4-204.fc18.i686.PAE #1 SMP Wed Jan 23 16:58:41
UTC 2013 i686 i686 i386 GNU/Linux</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359453226.030C21.17237--

--===============0793544075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0793544075==--
