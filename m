From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Sat, 09 Nov 2013 21:01:57 +0000
Message-ID: <bug-67628-8800-rwiMPAItSC@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1721031821=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1721031821==
Content-Type: multipart/alternative; boundary="1384030917.fA4bed5b2.4901"; charset="us-ascii"


--1384030917.fA4bed5b2.4901
Date: Sat, 9 Nov 2013 21:01:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[BISECTED] Monitor on       |[NVC1] [BISECTED] Monitor
                   |Display port shows          |on Display port shows
                   |distortions                 |distortions

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please try the kernel at nouveau/master
(http://cgit.freedesktop.org/nouveau/linux-2.6/), or drm-next. This includes a
fix for a particularly nasty bug for NVC1 specifically, which could manifest
itself in a wide variety of ways (since 3.11), as well as a few DP-related
fixes, e.g.
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=fa95062e052723fdeaede16af736c2bcc4cd1537
(and a couple others).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384030917.fA4bed5b2.4901
Date: Sat, 9 Nov 2013 21:01:57 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[BISECTED] Monitor on Display port shows distortions
           </td>
           <td>[NVC1] [BISECTED] Monitor on Display port shows distortions
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please try the kernel at nouveau/master
(<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/">http://cgit.freedesktop.org/nouveau/linux-2.6/</a>), or drm-next. This includes a
fix for a particularly nasty bug for NVC1 specifically, which could manifest
itself in a wide variety of ways (since 3.11), as well as a few DP-related
fixes, e.g.
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=fa95062e052723fdeaede16af736c2bcc4cd1537">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=fa95062e052723fdeaede16af736c2bcc4cd1537</a>
(and a couple others).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384030917.fA4bed5b2.4901--

--===============1721031821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1721031821==--
