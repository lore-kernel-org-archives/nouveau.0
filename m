From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80865] [NVE7] Hard hang (GPC0/TPC0/MP trap:
 MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)
Date: Thu, 03 Jul 2014 23:06:22 +0000
Message-ID: <bug-80865-8800-HL8C8HaZMN@http.bugs.freedesktop.org/>
References: <bug-80865-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0788951868=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80865-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0788951868==
Content-Type: multipart/alternative; boundary="1404428781.cEab2.6896"; charset="us-ascii"


--1404428781.cEab2.6896
Date: Thu, 3 Jul 2014 23:06:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80865

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Hard hang (GPC0/TPC0/MP     |[NVE7] Hard hang
                   |trap: MULTIPLE_WARP_ERRORS  |(GPC0/TPC0/MP trap:
                   |MEM_OUT_OF_BOUNDS)          |MULTIPLE_WARP_ERRORS
                   |                            |MEM_OUT_OF_BOUNDS)

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Those errors are most likely to happen when e.g. you're accessing a UBO out of
its bounds. Or if the driver messed up binding said UBO... or some code
generation error. However it should be ~harmless, except for the fact that the
render in question will be messed up.

BTW, what mesa version are you using?

The DISP errors at the end are the reason (or at least a demonstration) that
the GPU hung. I suspect the rest of the system was totally fine.

This also looks worrying:

[160330.118473] nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00004d6000
[PTE] from GR/GPC0/PROP_0 on channel 0x007f971000 [Xorg[981]]
[160330.118474] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 2, recovering...

I'm guessing the errors stressed the ctxsw logic and it couldn't handle some
condition.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404428781.cEab2.6896
Date: Thu, 3 Jul 2014 23:06:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80865">bug 80865</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)
           </td>
           <td>[NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80865#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80865">bug 80865</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Those errors are most likely to happen when e.g. you're accessing a UBO out of
its bounds. Or if the driver messed up binding said UBO... or some code
generation error. However it should be ~harmless, except for the fact that the
render in question will be messed up.

BTW, what mesa version are you using?

The DISP errors at the end are the reason (or at least a demonstration) that
the GPU hung. I suspect the rest of the system was totally fine.

This also looks worrying:

[160330.118473] nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00004d6000
[PTE] from GR/GPC0/PROP_0 on channel 0x007f971000 [Xorg[981]]
[160330.118474] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 2, recovering...

I'm guessing the errors stressed the ctxsw logic and it couldn't handle some
condition.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404428781.cEab2.6896--

--===============0788951868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0788951868==--
