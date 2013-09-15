From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52411] NV43 [GeForce 6600] nouveau in linux kernel
 3.4.0 to 3.4.5 hangs at boot
Date: Sun, 15 Sep 2013 19:25:24 +0000
Message-ID: <bug-52411-8800-gVoUhpdZiU@http.bugs.freedesktop.org/>
References: <bug-52411-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0706167025=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-52411-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0706167025==
Content-Type: multipart/alternative; boundary="1379273124.D61eBb233.1755"; charset="us-ascii"


--1379273124.D61eBb233.1755
Date: Sun, 15 Sep 2013 19:25:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=52411

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
We can't do anything without your VBIOS (/sys/kernel/debug/dri/0/vbios.rom).
It'd also be really nice to get a fresh stacktrace from that 3.10 (or newer)
kernel, as well as the disassembly I asked for.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379273124.D61eBb233.1755
Date: Sun, 15 Sep 2013 19:25:24 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411">bug 52411</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>We can't do anything without your VBIOS (/sys/kernel/debug/dri/0/vbios.rom).
It'd also be really nice to get a fresh stacktrace from that 3.10 (or newer)
kernel, as well as the disassembly I asked for.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379273124.D61eBb233.1755--

--===============0706167025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0706167025==--
