From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [VN117] xf86-video-nouveau 1.0.11 will not
 allow X to start
Date: Sun, 23 Aug 2015 19:08:38 +0000
Message-ID: <bug-91738-8800-88slFsT6tx@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1250969978=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91738-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1250969978==
Content-Type: multipart/alternative; boundary="1440356918.AFF522.12415"; charset="UTF-8"


--1440356918.AFF522.12415
Date: Sun, 23 Aug 2015 19:08:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|xf86-video-nouveau 1.0.11   |[VN117] xf86-video-nouveau
                   |will not allow X to start   |1.0.11 will not allow X to
                   |                            |start

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What is this -- xcmddc ? I suspect it's not helping.

But actually your problem is due to xf86-video-intel built against a recent
libdrm version. You either need a patch, or to downgrade libdrm below 2.4.60.
The intel ddx patch is available at
http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=7fe2b2948652443ff43d907855bd7a051d54d309

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440356918.AFF522.12415
Date: Sun, 23 Aug 2015 19:08:38 +0000
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
   title="NEW - [VN117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>xf86-video-nouveau 1.0.11 will not allow X to start
           </td>
           <td>[VN117] xf86-video-nouveau 1.0.11 will not allow X to start
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [VN117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [VN117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What is this -- xcmddc ? I suspect it's not helping.

But actually your problem is due to xf86-video-intel built against a recent
libdrm version. You either need a patch, or to downgrade libdrm below 2.4.60.
The intel ddx patch is available at
<a href="http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=7fe2b2948652443ff43d907855bd7a051d54d309">http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=7fe2b2948652443ff43d907855bd7a051d54d309</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440356918.AFF522.12415--

--===============1250969978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1250969978==--
