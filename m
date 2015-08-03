From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91535] [NVE7] Chrome can cause a nouveau 'multiple
 instances of buffer' message when overlaying a menu leading to X lockup
Date: Mon, 03 Aug 2015 00:52:09 +0000
Message-ID: <bug-91535-8800-PzNyapJ3qN@http.bugs.freedesktop.org/>
References: <bug-91535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0492655102=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0492655102==
Content-Type: multipart/alternative; boundary="1438563129.EC7Bf02.27975"; charset="UTF-8"


--1438563129.EC7Bf02.27975
Date: Mon, 3 Aug 2015 00:52:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91535

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Chrome can cause a nouveau  |[NVE7] Chrome can cause a
                   |'multiple instances of      |nouveau 'multiple instances
                   |buffer' message when        |of buffer' message when
                   |overlaying a menu leading   |overlaying a menu leading
                   |to X lockup                 |to X lockup

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you say a bit more about your desktop environment? I've never seen this,
and I use both chrome and nouveau on a regular basis on a GF108 which is fairly
similar to kepler, at least wrt how buffers are added to validation lists.

Are you using a compositor, if so which one, and how is it configured? Is there
optimus involved, if so are you using DRI2 or DRI3? Are you using GLAMOR + DRI3
in the nouveau DDX?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1438563129.EC7Bf02.27975
Date: Mon, 3 Aug 2015 00:52:09 +0000
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
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535">bug 91535</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup
           </td>
           <td>[NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535">bug 91535</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you say a bit more about your desktop environment? I've never seen this,
and I use both chrome and nouveau on a regular basis on a GF108 which is fairly
similar to kepler, at least wrt how buffers are added to validation lists.

Are you using a compositor, if so which one, and how is it configured? Is there
optimus involved, if so are you using DRI2 or DRI3? Are you using GLAMOR + DRI3
in the nouveau DDX?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438563129.EC7Bf02.27975--

--===============0492655102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0492655102==--
