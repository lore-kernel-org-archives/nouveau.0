From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Tue, 06 Aug 2013 13:59:29 +0000
Message-ID: <bug-58556-8800-OMHorefdHB@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0049699833=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0049699833==
Content-Type: multipart/alternative; boundary="1375797569.0B33c213.15526"; charset="us-ascii"


--1375797569.0B33c213.15526
Date: Tue, 6 Aug 2013 13:59:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pierre.morrow-GANU6spQydw@public.gmane.org

--- Comment #12 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Hi Joanand,

(In reply to comment #6)
> Is there any config which would activate accel for 9400 but no accel for
> 9600? This would be very helpful for me.

You might also try, in nouveau_accel_init:

    if (device->chipset == 0x96)
        return;

It works without nouveau.noaccel=1 and has no scrambled screen (at least for
the GUI and the console, except for a tiny moment of full garbage (boot logo?)
but it gets cleared away after), but it is unstable (hanged up some times at
boot) and it spams a lot (more than 1600 lines) of

     nouveau E[PFB][0000:03:00:0] trapped write at 0x0000546000 on channel
0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT


Strangely, when connecting an external monitor to the laptop (MacBook Pro mid
2009, same cards), the GUI isn't scrambled any more and the console still is,
but in a "better way".


I'll try to find why with an external monitor or with acceleration on the 9400,
the handover goes well.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375797569.0B33c213.15526
Date: Tue, 6 Aug 2013 13:59:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>pierre.morrow&#64;free.fr
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Hi Joanand,

(In reply to <a href="show_bug.cgi?id=58556#c6">comment #6</a>)
<span class="quote">&gt; Is there any config which would activate accel for 9400 but no accel for
&gt; 9600? This would be very helpful for me.</span >

You might also try, in nouveau_accel_init:

    if (device-&gt;chipset == 0x96)
        return;

It works without nouveau.noaccel=1 and has no scrambled screen (at least for
the GUI and the console, except for a tiny moment of full garbage (boot logo?)
but it gets cleared away after), but it is unstable (hanged up some times at
boot) and it spams a lot (more than 1600 lines) of

     nouveau E[PFB][0000:03:00:0] trapped write at 0x0000546000 on channel
0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT


Strangely, when connecting an external monitor to the laptop (MacBook Pro mid
2009, same cards), the GUI isn't scrambled any more and the console still is,
but in a &quot;better way&quot;.


I'll try to find why with an external monitor or with acceleration on the 9400,
the handover goes well.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375797569.0B33c213.15526--

--===============0049699833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0049699833==--
