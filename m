From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 16:16:40 +0000
Message-ID: <bug-79266-8800-WrNOY8Yqc6@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0517540316=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0517540316==
Content-Type: multipart/alternative; boundary="1401120999.cEd5628e2.4951"; charset="us-ascii"


--1401120999.cEd5628e2.4951
Date: Mon, 26 May 2014 16:16:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|major                       |normal
            Summary|(two) GT 430 / GF108        |[NVC1] GT 430 / GF108
                   |sluggish, unstable          |sluggish, unstable
                   |performance and blue tint   |performance and blue tint
                   |with vdpau                  |with vdpau

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This is a complete ramble... lots of various issues. Pick one and we can go
from there. Otherwise it becomes a placeholder bug for "there are _still_
things that don't work quite right for me". A few observations:

(a) Reclocking isn't supported on your card. Compared to blob driver, your card
is running at 1/2 the memory clock speed (and 4/7ths of the shader speed, but
the lower memory speed can really kill things). Opening bugs about this will
just get them insta-closed. It's not that we don't care, but we know that
reclocking isn't supported, and having bugs open about it will do nothing but
clog up the bug tool

(b) You don't have the firmware for video hardware acceleration, so you're only
using the presentation layer of vdpau. (I divined this from the "unable to load
firmware data" messages from the BSP engine.) No clue why the colors are messed
up though, that's quite odd. Perhaps something flipped the order of the UV
planes. But this is the first I'm hearing about this, I suspect it would have
come up before if it was that simple...

(c) Tearing is an issue with the nouveau driver. Unresolved, and also known.
Setting GLXVblank can help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401120999.cEd5628e2.4951
Date: Mon, 26 May 2014 16:16:39 +0000
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
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Severity</td>
           <td>major
           </td>
           <td>normal
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>(two) GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau
           </td>
           <td>[NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This is a complete ramble... lots of various issues. Pick one and we can go
from there. Otherwise it becomes a placeholder bug for &quot;there are _still_
things that don't work quite right for me&quot;. A few observations:

(a) Reclocking isn't supported on your card. Compared to blob driver, your card
is running at 1/2 the memory clock speed (and 4/7ths of the shader speed, but
the lower memory speed can really kill things). Opening bugs about this will
just get them insta-closed. It's not that we don't care, but we know that
reclocking isn't supported, and having bugs open about it will do nothing but
clog up the bug tool

(b) You don't have the firmware for video hardware acceleration, so you're only
using the presentation layer of vdpau. (I divined this from the &quot;unable to load
firmware data&quot; messages from the BSP engine.) No clue why the colors are messed
up though, that's quite odd. Perhaps something flipped the order of the UV
planes. But this is the first I'm hearing about this, I suspect it would have
come up before if it was that simple...

(c) Tearing is an issue with the nouveau driver. Unresolved, and also known.
Setting GLXVblank can help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401120999.cEd5628e2.4951--

--===============0517540316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0517540316==--
