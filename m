From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92922] [NVE6] Xorg random freeze
Date: Tue, 05 Apr 2016 07:56:32 +0000
Message-ID: <bug-92922-8800-lbNpkim6Rj@http.bugs.freedesktop.org/>
References: <bug-92922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1855572537=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1855572537==
Content-Type: multipart/alternative; boundary="14598429920.F3458.32565";
 charset="UTF-8"


--14598429920.F3458.32565
Date: Tue, 5 Apr 2016 07:56:32 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92922

--- Comment #4 from Julien HENRY <henryju-Qt13gs6zZMY@public.gmane.org> ---
It seems I have a similar issue but on kwin. I was also scrolling in Chrome
when the problem occurred (screen was frozen, I had to reboot):

Logs at the time of crash were filled with tons of:
kernel: nouveau 0000:01:00.0: gr: TRAP ch 8 [007f439000 kwin_x11[1624]]
avril 05 09:39:21 localhost.localdomain kernel: nouveau 0000:01:00.0: gr:
GPC1/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x = 1936, y = 1392,
format =
kernel: nouveau 0000:01:00.0: gr: TRAP ch 8 [007f439000 kwin_x11[1624]]

(journal file size is 160Mb)

mesa-dri-drivers-11.1.0-2.20151218.fc23.x86_64

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598429920.F3458.32565
Date: Tue, 5 Apr 2016 07:56:32 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Xorg random freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92922#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Xorg random freeze"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92922">bug 92922</a>
              from <span class="vcard"><a class="email" href="mailto:henryju&#64;yahoo.fr" title="Julien HENRY &lt;henryju&#64;yahoo.fr&gt;"> <span class="fn">Julien HENRY</span></a>
</span></b>
        <pre>It seems I have a similar issue but on kwin. I was also scrolling in Chrome
when the problem occurred (screen was frozen, I had to reboot):

Logs at the time of crash were filled with tons of:
kernel: nouveau 0000:01:00.0: gr: TRAP ch 8 [007f439000 kwin_x11[1624]]
avril 05 09:39:21 localhost.localdomain kernel: nouveau 0000:01:00.0: gr:
GPC1/PROP trap: 00000080 [ZETA_STORAGE_TYPE_MISMATCH] x = 1936, y = 1392,
format =
kernel: nouveau 0000:01:00.0: gr: TRAP ch 8 [007f439000 kwin_x11[1624]]

(journal file size is 160Mb)

mesa-dri-drivers-11.1.0-2.20151218.fc23.x86_64</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598429920.F3458.32565--

--===============1855572537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1855572537==--
