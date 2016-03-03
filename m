From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92833] [NV117] nouveau E[ PFIFO][0000:01:00.0] read
 fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel
 0x007ed78000 [unknown]
Date: Thu, 03 Mar 2016 14:50:58 +0000
Message-ID: <bug-92833-8800-hhj1CQTujs@http.bugs.freedesktop.org/>
References: <bug-92833-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1219033010=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92833-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1219033010==
Content-Type: multipart/alternative; boundary="14570166580.c78fAE03E.13542";
 charset="UTF-8"


--14570166580.c78fAE03E.13542
Date: Thu, 3 Mar 2016 14:50:58 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92833

--- Comment #4 from Mike <bugs.freedesktop.org-wCE3ViLK591g9hUCZPvPmw@public.gmane.org> ---
I'm hitting this bug with kernel 4.4.3-amd64 from
http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.3-wily/

There were pure X server (no DM) and three apps: two OpenGL and one Flash - all
of them decoding and displaying video. Video stopped on three screens after
kernel error.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14570166580.c78fAE03E.13542
Date: Thu, 3 Mar 2016 14:50:58 +0000
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
   title="NEW - [NV117] nouveau E[ PFIFO][0000:01:00.0] read fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel 0x007ed78000 [unknown]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92833#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV117] nouveau E[ PFIFO][0000:01:00.0] read fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel 0x007ed78000 [unknown]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92833">bug 92833</a>
              from <span class="vcard"><a class="email" href="mailto:bugs.freedesktop.org&#64;pm.port0.org" title="Mike &lt;bugs.freedesktop.org&#64;pm.port0.org&gt;"> <span class="fn">Mike</span></a>
</span></b>
        <pre>I'm hitting this bug with kernel 4.4.3-amd64 from
<a href="http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.3-wily/">http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.4.3-wily/</a>

There were pure X server (no DM) and three apps: two OpenGL and one Flash - all
of them decoding and displaying video. Video stopped on three screens after
kernel error.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14570166580.c78fAE03E.13542--

--===============1219033010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1219033010==--
