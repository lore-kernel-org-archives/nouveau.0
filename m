From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Fri, 02 May 2014 23:44:17 +0000
Message-ID: <bug-54700-8800-52u3RngqpZ@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357358866=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0357358866==
Content-Type: multipart/alternative; boundary="1399074257.AE7EEb3D4.387"; charset="us-ascii"


--1399074257.AE7EEb3D4.387
Date: Fri, 2 May 2014 23:44:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #66 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
BTW, interesting. In your VBIOS, it tells us to do

0xcbf2: 7a 80 00 10 00 00 00 00 e0                     ZM_REG   R[0x100080] =
0xe0000000

Which is why that bit gets lost on resume (but not on kexec, since init scripts
don't run, since the adapter is already init'd). Good to know, that means that
any fixup would have to be made _after_ the bios gets executed... or more
likely, as part of the COMPUTE_MEM thing (meminit in
core/subdev/devinit/nv20.c), which gets executed in "init script 5", which
happens after that "init script 1" which contains the 0x100080 = 0xe0000000
command. Although then it wouldn't happen on boot, so nevermind. Has to happen
after the vbios executes.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399074257.AE7EEb3D4.387
Date: Fri, 2 May 2014 23:44:17 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c66">Comment # 66</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>BTW, interesting. In your VBIOS, it tells us to do

0xcbf2: 7a 80 00 10 00 00 00 00 e0                     ZM_REG   R[0x100080] =
0xe0000000

Which is why that bit gets lost on resume (but not on kexec, since init scripts
don't run, since the adapter is already init'd). Good to know, that means that
any fixup would have to be made _after_ the bios gets executed... or more
likely, as part of the COMPUTE_MEM thing (meminit in
core/subdev/devinit/nv20.c), which gets executed in &quot;init script 5&quot;, which
happens after that &quot;init script 1&quot; which contains the 0x100080 = 0xe0000000
command. Although then it wouldn't happen on boot, so nevermind. Has to happen
after the vbios executes.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399074257.AE7EEb3D4.387--

--===============0357358866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0357358866==--
