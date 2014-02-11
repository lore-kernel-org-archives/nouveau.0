From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74815] [NVA8,
 NVC1] no displayport output on quadro 400/600 cards
Date: Tue, 11 Feb 2014 03:02:01 +0000
Message-ID: <bug-74815-8800-og2GshHA4c@http.bugs.freedesktop.org/>
References: <bug-74815-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1569819285=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74815-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1569819285==
Content-Type: multipart/alternative; boundary="1392087720.36f1272.14509"; charset="us-ascii"


--1392087720.36f1272.14509
Date: Tue, 11 Feb 2014 03:02:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74815

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|nouveau: no displayport     |[NVA8,NVC1] no displayport
                   |output on quadro 400/600    |output on quadro 400/600
                   |cards                       |cards

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There's another bug about a DP regression... bug #67628, which bisected down to
5cc027f6b1e ("drm/nv50-/disp: handle supervisor tasks from workqueue"), first
appearing in 3.9-rc1. Could you verify that you're having trouble with the same
commit? If so, we can mark as a duplicate.

Otherwise, which log is that log from? Could you upload your VBIOS?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392087720.36f1272.14509
Date: Tue, 11 Feb 2014 03:02:00 +0000
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
   title="NEW --- - [NVA8,NVC1] no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815">bug 74815</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>nouveau: no displayport output on quadro 400/600 cards
           </td>
           <td>[NVA8,NVC1] no displayport output on quadro 400/600 cards
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8,NVC1] no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8,NVC1] no displayport output on quadro 400/600 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74815">bug 74815</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There's another bug about a DP regression... <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628">bug #67628</a>, which bisected down to
5cc027f6b1e (&quot;drm/nv50-/disp: handle supervisor tasks from workqueue&quot;), first
appearing in 3.9-rc1. Could you verify that you're having trouble with the same
commit? If so, we can mark as a duplicate.

Otherwise, which log is that log from? Could you upload your VBIOS?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392087720.36f1272.14509--

--===============1569819285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1569819285==--
