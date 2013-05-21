From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52411] NV43 [GeForce 6600] nouveau in linux kernel
 3.4.0 to 3.4.5 hangs at boot
Date: Tue, 21 May 2013 03:04:56 +0000
Message-ID: <bug-52411-8800-a237nBvuew@http.bugs.freedesktop.org/>
References: <bug-52411-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247321396=="
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


--===============1247321396==
Content-Type: multipart/alternative; boundary="1369105496.2eccD863.27268"; charset="us-ascii"


--1369105496.2eccD863.27268
Date: Tue, 21 May 2013 03:04:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=52411

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Does this still happen with linux v3.10-rc2 (latest at the time of writing)?

It would be nice to know what the first commit is that breaks things for you.
Please do a git bisect between v3.3 and v3.4 on the drivers/gpu/drm/nouveau
directory.

Alternatively (or in addition to), pick a recent kernel, get a crash dump
(similar to what the referenced redhat bug has), and provide disassembly of the
involved function (gdb nouveau.ko and then disassemble func_name). That way we
can tell exactly where it's dying. You might need to use netconsole to get the
crash dump, since it dies when initializing the video driver.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369105496.2eccD863.27268
Date: Tue, 21 May 2013 03:04:56 +0000
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
   title="NEW --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411">bug 52411</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Does this still happen with linux v3.10-rc2 (latest at the time of writing)?

It would be nice to know what the first commit is that breaks things for you.
Please do a git bisect between v3.3 and v3.4 on the drivers/gpu/drm/nouveau
directory.

Alternatively (or in addition to), pick a recent kernel, get a crash dump
(similar to what the referenced redhat bug has), and provide disassembly of the
involved function (gdb nouveau.ko and then disassemble func_name). That way we
can tell exactly where it's dying. You might need to use netconsole to get the
crash dump, since it dies when initializing the video driver.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369105496.2eccD863.27268--

--===============1247321396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1247321396==--
