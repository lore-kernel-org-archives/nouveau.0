From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77529] [NVE7] NVS 510 DP-3 output doesn't work
Date: Fri, 25 Apr 2014 00:09:21 +0000
Message-ID: <bug-77529-8800-JbQOC7cDKO@http.bugs.freedesktop.org/>
References: <bug-77529-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0127895932=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77529-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0127895932==
Content-Type: multipart/alternative; boundary="1398384561.aca70fAc2.15163"; charset="us-ascii"


--1398384561.aca70fAc2.15163
Date: Fri, 25 Apr 2014 00:09:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77529

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
PCIROM is almost always bad. You want to use PROM. There's a bug on Kepler
chips for reading from PROM where it sometimes fails. It should be fixed by

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=18acc6d84eba960804f38a21842c02f3981c1c18

Try either 3.15-rc2 or just apply that commit to your kernel. You may also be
able to boot with

nouveau.config=NvBios=PROM

however you'd still end up with a potentially corrupt vbios.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398384561.aca70fAc2.15163
Date: Fri, 25 Apr 2014 00:09:21 +0000
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
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529">bug 77529</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>PCIROM is almost always bad. You want to use PROM. There's a bug on Kepler
chips for reading from PROM where it sometimes fails. It should be fixed by

<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=18acc6d84eba960804f38a21842c02f3981c1c18">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=18acc6d84eba960804f38a21842c02f3981c1c18</a>

Try either 3.15-rc2 or just apply that commit to your kernel. You may also be
able to boot with

nouveau.config=NvBios=PROM

however you'd still end up with a potentially corrupt vbios.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398384561.aca70fAc2.15163--

--===============0127895932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0127895932==--
