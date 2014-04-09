From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77230] [NV4B] NV40 PGRAPH "unknown bits" - windows
 render in white
Date: Wed, 09 Apr 2014 15:22:15 +0000
Message-ID: <bug-77230-8800-xIcaTzXxTG@http.bugs.freedesktop.org/>
References: <bug-77230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0187578994=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77230-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0187578994==
Content-Type: multipart/alternative; boundary="1397056935.A6203E12.12862"; charset="us-ascii"


--1397056935.A6203E12.12862
Date: Wed, 9 Apr 2014 15:22:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77230

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|NV40 PGRAPH "unknown bits"  |[NV4B] NV40 PGRAPH "unknown
                   |- windows render in white   |bits" - windows render in
                   |                            |white

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, the errors are coming from blit commands (blit = copy image). So it makes
sense that you'd be seeing white or otherwise uninitialized screen areas.

This code hasn't exactly changed of late. It might even be a hw error of some
sort. I don't think others with NV4B chips are seeing this. And it's an unknown
error on top of that (that's the "unknown bits" part of it... normally it'd say
exactly what it was complaining about).

You can disable acceleration by adding NoAccel to the xorg config, or by
booting with nouveau.noaccel=1.

Unless you're able to identify a change of some sort that makes it go from
non-working to working (other than killing acceleration entirely), I'm not sure
that we'll be able to do much. I'm talking about kernel versions, ddx versions,
that sort of thing.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397056935.A6203E12.12862
Date: Wed, 9 Apr 2014 15:22:15 +0000
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
   title="NEW --- - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230">bug 77230</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>NV40 PGRAPH &quot;unknown bits&quot; - windows render in white
           </td>
           <td>[NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230">bug 77230</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, the errors are coming from blit commands (blit = copy image). So it makes
sense that you'd be seeing white or otherwise uninitialized screen areas.

This code hasn't exactly changed of late. It might even be a hw error of some
sort. I don't think others with NV4B chips are seeing this. And it's an unknown
error on top of that (that's the &quot;unknown bits&quot; part of it... normally it'd say
exactly what it was complaining about).

You can disable acceleration by adding NoAccel to the xorg config, or by
booting with nouveau.noaccel=1.

Unless you're able to identify a change of some sort that makes it go from
non-working to working (other than killing acceleration entirely), I'm not sure
that we'll be able to do much. I'm talking about kernel versions, ddx versions,
that sort of thing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397056935.A6203E12.12862--

--===============0187578994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0187578994==--
