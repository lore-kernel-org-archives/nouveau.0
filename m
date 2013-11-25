From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71824] [NVE6] NULL deref on boot when there is
 nothing in DCB on 3.13-rc
Date: Mon, 25 Nov 2013 10:27:50 +0000
Message-ID: <bug-71824-8800-zwAjQF2ziw@http.bugs.freedesktop.org/>
References: <bug-71824-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2048116460=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71824-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2048116460==
Content-Type: multipart/alternative; boundary="1385375271.e76fFeEB3.4409"; charset="us-ascii"


--1385375271.e76fFeEB3.4409
Date: Mon, 25 Nov 2013 10:27:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71824

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[HSW mobile                 |[NVE6] NULL deref on boot
                   |Regression]System booting   |when there is nothing in
                   |with Call Trace             |DCB on 3.13-rc

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like you have no outputs. I think this will lead to

    chan->vblank.nr_event = pdisp->vblank->index_nr;

failing in nv50_software_context_ctor, called from nouveau_accel_init since
pdisp->vblank == NULL. I suspect that ->index_nr is at offset 0x130 which
explains the CR2 that you see.

As a temporary workaround, booting with nouveau.noaccel=1 will avoid the crash
(and also remove your ability to use the card).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385375271.e76fFeEB3.4409
Date: Mon, 25 Nov 2013 10:27:51 +0000
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
   title="NEW --- - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824">bug 71824</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[HSW mobile Regression]System booting with Call Trace
           </td>
           <td>[NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824">bug 71824</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like you have no outputs. I think this will lead to

    chan-&gt;vblank.nr_event = pdisp-&gt;vblank-&gt;index_nr;

failing in nv50_software_context_ctor, called from nouveau_accel_init since
pdisp-&gt;vblank == NULL. I suspect that -&gt;index_nr is at offset 0x130 which
explains the CR2 that you see.

As a temporary workaround, booting with nouveau.noaccel=1 will avoid the crash
(and also remove your ability to use the card).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385375271.e76fFeEB3.4409--

--===============2048116460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2048116460==--
