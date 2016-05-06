From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95193] Nouveau not working with Quadro K2200 (NV117)
 and Debian Wheezy
Date: Fri, 06 May 2016 16:16:28 +0000
Message-ID: <bug-95193-8800-LuyWgmH3oO@http.bugs.freedesktop.org/>
References: <bug-95193-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0575507496=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95193-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0575507496==
Content-Type: multipart/alternative; boundary="14625513880.7c7A7f.24863";
 charset="UTF-8"


--14625513880.7c7A7f.24863
Date: Fri, 6 May 2016 16:16:28 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95193

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Regular Guy from comment #5)
> The overall goal is to run Qubes OS, so not sure if a later kernel is
> possible. Not sure if there's a way to backport 4.4.8's nouveau/drm into a
> 4.1.3 (probably not, but hey, I can haz hopes?)

Not sure what backport means... like grabbing the 4.4.8 kernel and editing
Makefile to say that the version is 4.1.3? Anyways, this sort of thing isn't
something we tend to worry about -- enough troubles as it is.

Link training and EDID fetch are moderately separate items. I think a number of
changes went into the DP logic to harden it against various things that
monitors do.

Since this is fixed in recent kernels, I'm going to close this.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14625513880.7c7A7f.24863
Date: Fri, 6 May 2016 16:16:28 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nouveau not working with Quadro K2200 (NV117) and Debian Wheezy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95193">bug 95193</a>
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
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nouveau not working with Quadro K2200 (NV117) and Debian Wheezy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95193#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Nouveau not working with Quadro K2200 (NV117) and Debian Wheezy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95193">bug 95193</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Regular Guy from <a href="show_bug.cgi?id=95193#c5">comment #5</a>)
<span class="quote">&gt; The overall goal is to run Qubes OS, so not sure if a later kernel is
&gt; possible. Not sure if there's a way to backport 4.4.8's nouveau/drm into a
&gt; 4.1.3 (probably not, but hey, I can haz hopes?)</span >

Not sure what backport means... like grabbing the 4.4.8 kernel and editing
Makefile to say that the version is 4.1.3? Anyways, this sort of thing isn't
something we tend to worry about -- enough troubles as it is.

Link training and EDID fetch are moderately separate items. I think a number of
changes went into the DP logic to harden it against various things that
monitors do.

Since this is fixed in recent kernels, I'm going to close this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14625513880.7c7A7f.24863--

--===============0575507496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0575507496==--
