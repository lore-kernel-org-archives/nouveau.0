From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91972] [NVE7] xorg/nouveau crashes when running
 wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes
Date: Fri, 11 Sep 2015 06:31:02 +0000
Message-ID: <bug-91972-8800-nfWJwvYKm4@http.bugs.freedesktop.org/>
References: <bug-91972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0757520712=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0757520712==
Content-Type: multipart/alternative; boundary="1441953062.6b0352.28471"; charset="UTF-8"


--1441953062.6b0352.28471
Date: Fri, 11 Sep 2015 06:31:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91972

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|xorg/nouveau crashes when   |[NVE7] xorg/nouveau crashes
                   |running wine's unit tests   |when running wine's unit
                   |under valgrind: EXA: malloc |tests under valgrind: EXA:
                   |failed for size -262140     |malloc failed for size
                   |bytes                       |-262140 bytes

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Wow, very uncommon configuration... nouveau as main and intel as "GPU". Are you
doing any actual offloading (of either outputs or rendering)?

exa/exa_migration_mixed.c:                FatalError("EXA: malloc failed for
size %d bytes\n",

pExaPixmap->sys_pitch * pPixmap->drawable.height

exa/exa_priv.h:    int sys_pitch;              /**< pitch of pixmap in system
memory */
include/pixmapstr.h:    unsigned short height;

I guess sys_pitch is somehow negative then.

Can you "bisect" the test, i.e. figure out which bit of it triggers the issue?
And perhaps modify that print to show what the individual values in that
multiplication are?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441953062.6b0352.28471
Date: Fri, 11 Sep 2015 06:31:02 +0000
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
   title="NEW - [NVE7] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972">bug 91972</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes
           </td>
           <td>[NVE7] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] xorg/nouveau crashes when running wine's unit tests under valgrind: EXA: malloc failed for size -262140 bytes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91972">bug 91972</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Wow, very uncommon configuration... nouveau as main and intel as &quot;GPU&quot;. Are you
doing any actual offloading (of either outputs or rendering)?

exa/exa_migration_mixed.c:                FatalError(&quot;EXA: malloc failed for
size %d bytes\n&quot;,

pExaPixmap-&gt;sys_pitch * pPixmap-&gt;drawable.height

exa/exa_priv.h:    int sys_pitch;              /**&lt; pitch of pixmap in system
memory */
include/pixmapstr.h:    unsigned short height;

I guess sys_pitch is somehow negative then.

Can you &quot;bisect&quot; the test, i.e. figure out which bit of it triggers the issue?
And perhaps modify that print to show what the individual values in that
multiplication are?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441953062.6b0352.28471--

--===============0757520712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0757520712==--
