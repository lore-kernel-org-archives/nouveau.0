From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71994] Can't set performance level on Fermi card,
	Linux 3.13
Date: Mon, 25 Nov 2013 17:35:22 +0000
Message-ID: <bug-71994-8800-gMegNGRVK8@http.bugs.freedesktop.org/>
References: <bug-71994-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0867093526=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71994-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0867093526==
Content-Type: multipart/alternative; boundary="1385400922.567d1b6b1.31860"; charset="us-ascii"


--1385400922.567d1b6b1.31860
Date: Mon, 25 Nov 2013 17:35:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71994

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Nope, not supposed to work.

Feel free to apply the equivalent of
http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=devel-pm&id=ffbf93ba1eb5f05d22bd5419e5f314188801155b
to your kernel, and if you want memory reclocking in addition to engine
reclocking, you can boot with nouveau.config=NvMemExec=1. However at this point
we're not interested in whether it works or not -- it (probably) doesn't on a
whole bunch of cards.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385400922.567d1b6b1.31860
Date: Mon, 25 Nov 2013 17:35:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Can't set performance level on Fermi card, Linux 3.13"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71994">bug 71994</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Can't set performance level on Fermi card, Linux 3.13"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71994#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Can't set performance level on Fermi card, Linux 3.13"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71994">bug 71994</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Nope, not supposed to work.

Feel free to apply the equivalent of
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=devel-pm&amp;id=ffbf93ba1eb5f05d22bd5419e5f314188801155b">http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=devel-pm&amp;id=ffbf93ba1eb5f05d22bd5419e5f314188801155b</a>
to your kernel, and if you want memory reclocking in addition to engine
reclocking, you can boot with nouveau.config=NvMemExec=1. However at this point
we're not interested in whether it works or not -- it (probably) doesn't on a
whole bunch of cards.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385400922.567d1b6b1.31860--

--===============0867093526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0867093526==--
